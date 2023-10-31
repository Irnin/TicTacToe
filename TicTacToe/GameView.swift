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
            
            if let winner = game.winner {
                Button{
                    game.clean()
                } label: {
                    ZStack {
                        Rectangle()
                            .fill(.white)
                            .frame(width: 1000, height: 200)
                            .border(.green, width: 10)
                            .rotationEffect(.degrees(20))
                        
                        Text("\(game.getWinner()) Won!!!")
                            .font(.largeTitle)
                    }
                }
                
            }
        }
    }
        
}

#Preview {
    GameView()
}
