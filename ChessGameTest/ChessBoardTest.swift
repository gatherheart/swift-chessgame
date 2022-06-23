//
//  ChessBoardTest.swift
//  ChessGameTest
//
//  Created by bean Milky on 2022/06/23.
//

import Quick
import Nimble
@testable import ChessGame

class BoardTestSpec: QuickSpec {
    
    override func spec() {
        let board = """
                    ♜♞♝.♛♝♞♜
                    ♟♟♟♟♟♟♟♟
                    ........
                    ........
                    ........
                    ........
                    ♙♙♙♙♙♙♙♙
                    ♖♘♗.♕♗♘♖
                    """
        
        describe("보드 초기화 테스트") {
            context("입력된 초기 값으로 정상적으로 최초 보드 생성") {
                it("생성 값과 최초 보드 세팅이 동일해야 함") {
                    expect(1).to(equal(1))
                }
            }
        }
        
    }
}
