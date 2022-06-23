//
//  ChessGameTest.swift
//  ChessGameTest
//
//  Created by bean Milky on 2022/06/20.
//

import Quick
import Nimble
@testable import ChessGame

class RuleTestSpec: QuickSpec {
    
    //
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
    
    let pieceTypes: [ChessPiece.PieceType] = [.luke, .knight, .bishop, .none, .queen, .bishop, .knight, .luke]
    var board: [Position: ChessPiece] = [:]
    var ruleBook: RuleRetunable = ChessRuleBook()

    private func setBoard() {
        for row in Position.Row.allCases {
            for col in Position.Column.allCases {
                switch row {
                case .one:
                    board[Position(row: row, col: col)] = ChessPiece(type: pieceTypes[col.rawValue], color: .black)
                case .two:
                    board[Position(row: row, col: col)] = ChessPiece(type: .pawn, color: .black)
                case .seven:
                    board[Position(row: row, col: col)] = ChessPiece(type: .pawn, color: .white)
                case .eight:
                    board[Position(row: row, col: col)] = ChessPiece(type: pieceTypes[col.rawValue], color: .white)
                default:
                    board[Position(row: row, col: col)] = ChessPiece.nonePiece
                }
            }
        }
        
    }
    
    
    override func spec() {
        
        beforeEach {
            self.setBoard()
            self.ruleBook = ChessRuleBook()
        }
        
        describe("보드 초기화 테스트") {
            context("startPositions를 호출하면 최초 보드 생성") {
                let positions = self.ruleBook.startPositions()
                
                it("positions row x col의 개수가 맞아야 함") {
                    expect(positions.count).to(equal(self.pieceTypes.count * 2 + Position.Column.allCases.count * 2))
                }
                
                for row in Position.Row.allCases {
                    for col in Position.Column.allCases {
                        guard let position = positions[Position(row: row, col: col)] else { continue }
                        
                        it("생성 값과 최초 보드 세팅이 동일해야 함 - \(row.rawValue), \(col.rawValue)") {
                            expect(position).to(equal(self.board[Position(row: row, col: col)]))
                        }
                    }
                }
            }
        }
        
    }
}
