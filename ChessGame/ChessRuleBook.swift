//
//  ChessRuleBook.swift
//  ChessGame
//
//  Created by bean Milky on 2022/06/20.
//

import Foundation

protocol RuleRetunable {
    func validPositions() -> [Position]
}

class ChessRuleBook: RuleRetunable {
    func validPositions() -> [Position] {
        return []
    }
}
