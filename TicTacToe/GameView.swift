//
//  GameView.swift
//  TicTacToe
//
//  Created by Łukasz Michalak on 31/10/2023.
//

import SwiftUI

struct GameView: View {
    @ObservedObject var game = Game()
    
    var body: some View {
        
        ZStack {
            // Display player tur
            if game.currentPlayer == .circle {
                Image(systemName: "circle")
                    .font(.system(size: 300))
                    .offset(x: -100, y: -100)
                
            } else {
                Image(systemName: "cross.fill")
                    .font(.system(size: 300))
                    .rotationEffect(.degrees(45))
                    .offset(x: 100, y: 100)
            }
            
            // Display score view
            VStack {
                Spacer()
                
                ZStack {
                    Rectangle()
                        .frame(height: 120)
                        .lineLimit(nil)
                        .shadow(color: .blue, radius: 100, x: 0, y: -100)
                        .ignoresSafeArea()
                    
                    HStack {
                        HStack {
                            Image(systemName: "circle")
                            
                            Text(": \(game.oWins)")
                        }
                        .font(.system(size: 70))
                        .foregroundStyle(.blue)
                        .offset(x: -20)
                        .zIndex(1)
                        
                        Spacer()
                        
                        HStack {
                            Text("\(game.xWins) :")
                            
                            Image(systemName: "cross.fill")
                                .rotationEffect(.degrees(45))
                            
                        }
                        .font(.system(size: 70))
                        .foregroundStyle(.blue)
                        .offset(x: 20)
                        .zIndex(1)
                    }
                }
            }
            
            // Display board
            VStack {
                HStack {
                    SquareView(game: game, id: 1)
                    SquareView(game: game, id: 2)
                    SquareView(game: game, id: 3)
                }
                HStack {
                    SquareView(game: game, id: 4)
                    SquareView(game: game, id: 5)
                    SquareView(game: game, id: 6)
                }
                HStack {
                    SquareView(game: game, id: 7)
                    SquareView(game: game, id: 8)
                    SquareView(game: game, id: 9)
                }
            }
            
            // Display notification
            if game.winner != nil {
                NotificationStrip(game: game, notification: "\(game.getWinner()) Won!!!", color: .green)
                
            } else if game.freeSpaces == 0 {
                NotificationStrip(game: game, notification: "There is no winner", color: .yellow)
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    GameView()
}
