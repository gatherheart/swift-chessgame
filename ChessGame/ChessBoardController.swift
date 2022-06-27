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

open class ChessGameController: GameControllable {
    
    
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
    
    public init(ruleBook: RuleReturnable) {
        self.ruleBook = ruleBook
        self.board = ChessBoard(positions: ruleBook.startPositions())
    }
    
    public func start() {
    }
    
    private func move(from: Position, to: Position) -> Bool {
        guard let fromPiece = board.piece(at: from) else { return false }
        guard ruleBook.isAvailable(with: fromPiece, from: from, to: to) else { return false }
        
        let success = board.set(piece: fromPiece, from: from, to: to)
        return success
    }
    
    
}
