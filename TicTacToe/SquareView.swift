//
//  SquareView.swift
//  TicTacToe
//
//  Created by Łukasz Michalak on 31/10/2023.
//

import SwiftUI

struct SquareView: View {
    @ObservedObject var game: Game
    @State var id: Int = 0
    
    var body: some View {
        Button{
            game.setFigure(of: id)
        } label: {
            ZStack {
                Rectangle().frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                    .cornerRadius(20)
                
                if let figure = game.getFigure(of: id) {
                    Image(systemName: figure.rawValue)
                        .foregroundColor(.white)
                        .font(.system(size: 60))
                        .rotationEffect(.degrees(45))
                }
            }
        }
    }
}

#Preview {
    SquareView(game: Game(), id: 3)
}
