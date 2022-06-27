//
//  ChessPiece.swift
//  ChessGame
//
//  Created by bean Milky on 2022/06/20.
//

import Foundation

public struct ChessPiece: Hashable, CustomStringConvertible {
    
    public let type: PieceType
    public let color: Color
    public let movements: [Movement]

    init(type: PieceType, color: Color, movements: [Movement] = []) {
        self.color = color
        self.type = type
        self.movements = movements
    }
    
    init(type: PieceType) {
        self.color = .none
        self.type = type
        self.movements = []
    }
    
    public static func == (lhs: ChessPiece, rhs: ChessPiece) -> Bool {
        return lhs.type == rhs.type && lhs.color == rhs.color
    }
    
    static var nonePiece: ChessPiece {
        .init(type: .none, color: .none)
    }
    
    var point: Int {
        return type.point
    }
    
    var isBlack: Bool {
        return color == .black
    }
    
    var isWhite: Bool {
        return color == .white
    }
    
    public var toString: String {
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

    public var description: String {
        toString
    }
}

// MARK: type of pieces
public extension ChessPiece {
    
    enum PieceType {
        case none, pawn, bishop, luke, queen, knight
        
        public var point: Int {
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
        case none, black, white
    }
    
}
