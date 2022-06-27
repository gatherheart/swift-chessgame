//
//  ChessRuleBook.swift
//  ChessGame
//
//  Created by bean Milky on 2022/06/20.
//

import Foundation

protocol RuleReturnable {
    func startPositions() -> [Position: ChessPiece]
    func isAvailable(with piece: ChessPiece, from: Position, to: Position) -> Bool
}

class ChessRuleBook: RuleReturnable {
    typealias PieceType = ChessPiece.PieceType
    
    func startPositions() -> [Position: ChessPiece] {
        return makeLine(at: 0)
            .merge(makeLine(at: 1))
            .merge(makeLine(at: 6))
            .merge(makeLine(at: 7))
    }
    
    func isAvailable(with piece: ChessPiece, from: Position, to: Position) -> Bool {
        let movements = piece.movements
        let moveToDestination = movement(from: from, to: to)
        
        for move in movements {
            
            guard Set(move.directions) == Set(moveToDestination.directions) else {
                continue
            }
            
            if move.repeatable, moveToDestination.directions.count % move.directions.count == 0 {
                let count: Int = moveToDestination.directions.count / move.directions.count
                let directions = Array(repeating: move.directions, count: count).reduce([], +)
                
                if directions.containsSameElements(as: moveToDestination.directions) {
                    return true
                }
            } else if move.repeatable == false, move.directions.count == moveToDestination.directions.count {
                return true
            } else {
                continue
            }
        }
        
        return false
    }
    
    private func movement(from: Position, to: Position) -> Movement {
        let vertical = to.row.rawValue - from.row.rawValue
        let horizontal = to.col.rawValue - from.col.rawValue
        
        let verticalDirections = Movement.directions(of: vertical > 0 ? .up : .down, count: vertical)
        let horizontalDirections = Movement.directions(of: horizontal > 0 ? .right : .left, count: horizontal)
        
        return Movement(repeatable: false, directions: verticalDirections + horizontalDirections)
    }
    
    private func movements(of pieceType: ChessPiece.PieceType, color: ChessPiece.Color) -> [Movement] {
        
        let up: Movement.Direction = color == .black ? .up : .down
        let down: Movement.Direction = color == .black ? .down : .up
        
        switch pieceType {
        case .queen:
            return [Movement(repeatable: true, directions: [up]),
                    Movement(repeatable: true, directions: [up, .right]),
                    Movement(repeatable: true, directions: [.right]),
                    Movement(repeatable: true, directions: [.right, down]),
                    Movement(repeatable: true, directions: [down]),
                    Movement(repeatable: true, directions: [down, .left]),
                    Movement(repeatable: true, directions: [.left]),
                    Movement(repeatable: true, directions: [.left, up])]
        case .luke:
            return [Movement(repeatable: true, directions: [up]),
                    Movement(repeatable: true, directions: [.right]),
                    Movement(repeatable: true, directions: [down]),
                    Movement(repeatable: true, directions: [.left])]
        case .pawn:
            return [Movement(repeatable: false, directions: [up])]
        case .bishop:
            return [Movement(repeatable: true, directions: [up, .right]),
                    Movement(repeatable: true, directions: [.right, down]),
                    Movement(repeatable: true, directions: [down, .left]),
                    Movement(repeatable: true, directions: [.left, up])]
        case .knight:
            return [Movement(repeatable: false, directions: [up, up, .right]),
                    Movement(repeatable: false, directions: [up, up, .left])]
        case .none:
            return []
        }
    }
    
    private func pieces(at row: Position.Row, with color: ChessPiece.Color) -> [ChessPiece] {
        switch row {
        case .one, .eight:
            return [.luke, .knight, .bishop, .none, .queen, .bishop, .knight, .luke]
                .map { type in ChessPiece(type: type, color: color, movements: movements(of: type, color: color))}
        case .two, .seven:
            return Position.Row.allCases.map { _ in ChessPiece(type: .pawn, color: color, movements: movements(of: .pawn, color: color))}
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

private extension Array where Element: Comparable {
    func containsSameElements(as other: [Element]) -> Bool {
        return self.count == other.count && self.sorted() == other.sorted()
    }
}
