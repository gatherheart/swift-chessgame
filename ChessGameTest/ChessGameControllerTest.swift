//
//  ChessPositionTest.swift
//  ChessGameTest
//
//  Created by bean Milky on 2022/06/23.
//

import Quick
import Nimble
@testable import ChessGame

class ChessGameControllerSepc: QuickSpec {
    
    override func spec() {
        
        var game: GameControllable!
        
        beforeEach {
            game = ChessGameController(ruleBook: ChessRuleBook())
            game.start()
        }
        
        describe("이동 가능 여부 체크 테스트") {
            context("chess piece 이동 여부 체크") {
            
            }
        }
    }
}

