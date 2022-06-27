//
//  ChessBoard.swift
//  ChessGame
//
//  Created by bean Milky on 2022/06/20.
//

import Foundation

public class ChessBoard {
    public typealias Row = Position.Row
    public typealias Column = Position.Column
    
    private var board: [Position: ChessPiece] = [:]
    
    public init(positions: [Position: ChessPiece]) {
        self.initialize()
        self.board = self.board.merge(positions)
    }
    
    func positions() -> [Position] {
        return Array(board.keys)
    }
    
    func piece(at position: Position) -> ChessPiece? {
        return board[position]
    }
    
    func set(piece: ChessPiece, from: Position, to: Position) -> Bool {
        guard let toPiece = board[to], toPiece.color != piece.color else { return false }
        board[from] = .nonePiece
        board[to] = piece
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
    
    public subscript(index: Row) -> [ChessPiece] {
        get {
            Column.allCases.compactMap { col in board[Position(row: index, col: col)] }
        }
    }
}

extension ChessBoard: CustomStringConvertible {
    public var description: String {
        var result = ""
        for row in Position.Row.allCases {
            result += "\(self[row].map { $0.toString }.joined())\n"
        }
        return result
    }
}
