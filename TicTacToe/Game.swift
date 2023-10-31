//
//  Board.swift
//  TicTacToe
//
//  Created by Łukasz Michalak on 31/10/2023.
//

import Foundation

enum Figures: String {
    case circle = "circle"
    case cross = "cross.fill"
}

class Game: ObservableObject {
    // board IDs
    // 1 2 3
    // 4 5 6
    // 7 8 9
    @Published var board: [[Figures?]] = Array(repeating: Array(repeating: nil, count: 3), count: 3)
    @Published var winner: Figures? = nil
    var currentPlayer: Figures = .cross
    
    // Public functions
    
    func getWinner() -> String {
        if winner == .circle {
            return "Circle"
        } else {
            return "Cross"
        }
    }
    
    func clean() {
        winner = nil
        
        for i in 0...2 {
            for j in 0...2 {
                board[i][j] = nil
            }
        }
    }
    
    func getFigure(of id: Int) -> Figures? {
        switch(id) {
        case 1:
            return board[0][0]
        case 2:
            return board[0][1]
        case 3:
            return board[0][2]
        case 4:
            return board[1][0]
        case 5:
            return board[1][1]
        case 6:
            return board[1][2]
        case 7:
            return board[2][0]
        case 8:
            return board[2][1]
        case 9:
            return board[2][2]
        default:
            return nil
        }
    }
    
    func setFigure(of id: Int) {
        if winner != nil {
            return
        }
        
        if getFigure(of: id) != nil {
            // Pole jest już zajęte
        } else {
            
            switch(id) {
            case 1:
                board[0][0] = currentPlayer
            case 2:
                board[0][1] = currentPlayer
            case 3:
                board[0][2] = currentPlayer
            case 4:
                board[1][0] = currentPlayer
            case 5:
                board[1][1] = currentPlayer
            case 6:
                board[1][2] = currentPlayer
            case 7:
                board[2][0] = currentPlayer
            case 8:
                board[2][1] = currentPlayer
            case 9:
                board[2][2] = currentPlayer
            default:
                print("This code will never execute")
            }
            
            checkWin()
            swapPlayer()
        }
    }
    
    // Private functions
    
    private func swapPlayer() {
        if currentPlayer == .circle {
            currentPlayer = .cross
        } else {
            currentPlayer = .circle
        }
    }
    
    // Sprawdzanie trzech podanych pól
    private func checkRow(id1: Int, id2: Int, id3: Int) -> Figures? {
        
        if getFigure(of: id1) == getFigure(of: id2) && getFigure(of: id2) == getFigure(of: id3) {
            return getFigure(of: id1)
        } else {
            return nil
        }
    }
    
    // Sprawdzanie wszystkich pól
    private func checkWin(){
        
        // Checking rows
        if let winner = checkRow(id1: 1, id2: 2, id3: 3) {
            self.winner = winner
        } else if let winner = checkRow(id1: 4, id2: 5, id3: 6) {
            self.winner = winner
        } else if let winner = checkRow(id1: 7, id2: 8, id3: 9) {
            self.winner = winner
        }
        
        // Checking collumns
        else if let winner = checkRow(id1: 1, id2: 4, id3: 7) {
            self.winner = winner
        } else if let winner = checkRow(id1: 2, id2: 5, id3: 8) {
            self.winner = winner
        } else if let winner = checkRow(id1: 3, id2: 6, id3: 9) {
            self.winner = winner
        }
        
        // Checking cross
        else if let winner = checkRow(id1: 1, id2: 5, id3: 9) {
            self.winner = winner
        } else if let winner = checkRow(id1: 3, id2: 5, id3: 7) {
            self.winner = winner
        }

    }
}
