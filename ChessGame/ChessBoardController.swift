//
//  ChessBoardController.swift
//  ChessGame
//
//  Created by bean Milky on 2022/06/27.
//

import Foundation

protocol GameControllable {
    func start() -> Void
}

class ChessGameController: GameControllable {
    
    
    /*
      ABCDEFGH
     1♜♞♝.♛♝♞♜
     2♟♟♟♟♟♟♟♟
     3........
     4........
     5........
     6........
     7♙♙♙♙♙♙♙♙
     8♖♘♗.♕♗♘♖
      ABCDEFGH
     */
    
    let board: ChessBoard
    let ruleBook: RuleReturnable
    
    init(ruleBook: RuleReturnable) {
        self.ruleBook = ruleBook
        self.board = ChessBoard(positions: ruleBook.startPositions())
    }
    
    func start() {
        let from = Position(row: .one, col: .a)
        move(from: from, to: Position(row: .two, col: .a))
    }
    
    private func move(from: Position, to: Position) -> Bool {
        guard let fromPiece = board.piece(at: from) else { return false }
        guard ruleBook.isAvailable(with: fromPiece, from: from, to: to) else { return false }
        
        let success = board.set(piece: fromPiece, from: from, to: to)
        return success
    }
    
    
}
