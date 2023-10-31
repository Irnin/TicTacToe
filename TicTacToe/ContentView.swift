//
//  ContentView.swift
//  TicTacToe
//
//  Created by Łukasz Michalak on 31/10/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Tic Tac Toe")
                .font(.largeTitle)
            
            GameView()
            
            
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
