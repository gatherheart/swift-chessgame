//
//  ChessBoard.swift
//  ChessGame
//
//  Created by bean Milky on 2022/06/20.
//

import Foundation

struct BoardSize {
    let width: Int
    let height: Int
}

class ChessBoard {
    typealias Row = Position.Row
    typealias Column = Position.Column
    
    private var board: [Position: ChessPiece] = [:]
    
    init(positions: [Position: ChessPiece]) {
        self.initialize()
        self.board = self.board.merge(positions)
    }
    
    func piece(at position: Position) -> ChessPiece? {
        return board[position]
    }
    
    func move(piece: ChessPiece, to position: Position) -> Bool {
        return true
    }
    
    func initialize() {
        let rows = Row.allCases
        let cols = Column.allCases
        board = rows.reduce([:]) { prev, row -> [Position: ChessPiece] in
                return prev.merge(
                    cols.reduce(into: [:]) { prev, col in
                        prev.updateValue(.nonePiece, forKey: Position(row: row, col: col))
                    }
                )
        }
    }
    
    subscript(index: Row) -> [ChessPiece] {
        get {
            Column.allCases.compactMap { col in board[Position(row: index, col: col)] }
        }
    }
}

extension ChessBoard: CustomStringConvertible {
    var description: String {
        var result = ""
        for row in Position.Row.allCases {
            result += "\(self[row].map { $0.toString }.joined())\n"
        }
        return result
    }
}
