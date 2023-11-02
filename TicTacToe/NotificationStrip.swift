//
//  NotificationStrip.swift
//  TicTacToe
//
//  Created by Łukasz Michalak on 01/11/2023.
//

import SwiftUI

struct NotificationStrip: View {
    @State var game: Game
    @State var notification: String
    @State var color: Color
    
    var body: some View {
        
        Button{
            game.clean()
        } label: {
            ZStack {
                Rectangle()
                    .fill(.white)
                    .frame(width: 1000, height: 200)
                    .border(color, width: 10)
                    .shadow(color: color, radius: 30)
                    .rotationEffect(.degrees(20))
                
                Text(notification)
                    .font(.largeTitle)
                    .rotationEffect(.degrees(20))
                    .foregroundColor(color)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

#Preview {
    let game = Game()
    let notification = "Lorem Ipsum"
    
    return NotificationStrip(game: game, notification: notification, color: .yellow)
}
