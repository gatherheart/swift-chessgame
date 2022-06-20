//
//  ChessPiece.swift
//  ChessGame
//
//  Created by bean Milky on 2022/06/20.
//

import Foundation

struct ChessPiece {
    
    let type: PieceType
    let color: Color
    
    var point: Int {
        return type.point
    }
    
    var isBlack: Bool {
        return color == .black
    }
    
    var isWhite: Bool {
        return color == .white
    }
    
    var toString: String {
        switch type {
        case .none:
            return "."
        case .pawn:
            return isBlack ? "♟" : "♙"
        case .bishop:
            return isBlack ? "♝" : "♗"
        case .luke:
            return isBlack ? "♜" : "♖"
        case .queen:
            return isBlack ? "♛" : "♕"
        case .knight:
            return isBlack ? "♞" : "♘"
        }
    }

}

// MARK: type of pieces
extension ChessPiece {
    
    enum PieceType {
        case none, pawn, bishop, luke, queen, knight
        
        var point: Int {
            switch self {
            case .none:
                return 0
            case .pawn:
                return 1
            case .bishop, .knight:
                return 3
            case .luke:
                return 5
            case .queen:
                return 9
            }
        }
    }
    
    enum Color {
        case black, white
    }
    
}
