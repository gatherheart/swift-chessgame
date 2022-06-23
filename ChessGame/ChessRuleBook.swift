//
//  ChessRuleBook.swift
//  ChessGame
//
//  Created by bean Milky on 2022/06/20.
//

import Foundation

protocol RuleRetunable {
    func startPositions() -> [Position: ChessPiece]
    func validPositions(of piece: ChessPiece) -> [Position]
}

class ChessRuleBook: RuleRetunable {
    typealias PieceType = ChessPiece.PieceType
    
    func startPositions() -> [Position: ChessPiece] {
        return makeLine(at: 0)
            .merge(makeLine(at: 1))
            .merge(makeLine(at: 6))
            .merge(makeLine(at: 7))
    }
    
    func validPositions(of piece: ChessPiece) -> [Position] {
        return []
    }
    
    private func pieces(at row: Position.Row, with color: ChessPiece.Color) -> [ChessPiece] {
        switch row {
        case .one, .eight:
            return [.luke, .knight, .bishop, .none, .queen, .bishop, .knight, .luke]
                .map { type in ChessPiece(type: type, color: color)}
        case .two, .seven:
            return Position.Row.allCases.map { _ in ChessPiece(type: .pawn, color: color)}
        default:
            return Position.Row.allCases.map { _ in ChessPiece.nonePiece }
        }
    }
    
    private func makeLine(at index: Int) -> [Position: ChessPiece] {

        guard let row: Position.Row = Position.Row(rawValue: index) else { return [:] }
        let color: ChessPiece.Color = row.rawValue < 4 ? .black : .white
        let pieces = pieces(at: row, with: color)
        
        return (0..<8 as Range<Int>).reduce(into: [:]) { prev, index in prev.updateValue(pieces[index], forKey: Position(row: row, col: .init(rawValue: index)!)) }
    }
    
}
