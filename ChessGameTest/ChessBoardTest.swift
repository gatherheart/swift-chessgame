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
        
        var mockRuleBook: MockRuleBook!
        var board: ChessBoard!

        describe("보드 초기화 테스트") {
            
            beforeEach {
                mockRuleBook = MockRuleBook()
            }
        
            context("입력된 초기 값으로 정상적으로 최초 보드 생성") {

                beforeEach {
                    board = ChessBoard(positions: mockRuleBook.startPositions())
                }
                
                it("생성된 최초 보드가 의도된 대로 초기화 되어야 함") {
                    
                    let startPositions = mockRuleBook.startPositions()
                    
                    for position in startPositions.keys {
                        expect { board.piece(at: position) }.to(equal(startPositions[position]))
                    }
                }
                
                it("초기값이 정상적으로 board 내에 저장되어야 함") {
                    for position in board.positions() where board.piece(at: position)?.type != ChessPiece.PieceType.none {
                        expect { mockRuleBook.verify(position) }.to(beTrue())
                    }
                }

            }
        }
        
    }
}

private protocol Mockable {
    associatedtype T
    func verify(_ value: T) -> Bool
}

extension MockRuleBook: Mockable {
    func verify(_ value: Position) -> Bool {
        return (startPositions()[value] != nil)
    }
}

private class MockRuleBook: RuleReturnable {
    func startPositions() -> [Position: ChessPiece] {
        return [
            Position(row: .eight, col: .g): ChessPiece(type: .pawn, color: .white),
            Position(row: .one, col: .g): ChessPiece(type: .knight, color: .black),
            Position(row: .two, col: .g): ChessPiece(type: .luke, color: .white),
            Position(row: .seven, col: .g): ChessPiece(type: .queen, color: .white),
        ]
    }
    
    func validPositions(of piece: ChessPiece) -> [Position] {
        []
    }
}
