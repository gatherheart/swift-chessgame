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

    private func setBoard(_ borad: [Position: ChessBoard]) {
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
        
        var board: [Position: ChessPiece] = [:]
        var ruleBook: RuleReturnable!

        beforeEach {
            self.setBoard(board)
            ruleBook = ChessRuleBook()
        }
        
        describe("보드 초기화 룰 테스트") {
            context("startPositions를 호출하면 최초 보드 포지션 생성") {
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
        
        describe("이동 가능 여부 테스트") {
            
            var positions: [Position: ChessPiece]!
            
            beforeEach {
                positions = self.ruleBook.startPositions()
            }
            
            context("luke 이동 가능 경로 확인") {
                
                var chess: ChessPiece!
                var position: Position!
                
                beforeEach {
                    let filtered = positions.filter { $0.value.type == .luke && $0.value.color == .white }
                    chess = filtered.values.first!
                    position = filtered.keys.first!
                }
                
                it("luke 이동 경로 가능해야 함") {
                    expect { self.ruleBook.isAvailable(with: chess, from: position, to: Position(row: .six, col: .a))}.to(beTrue())
                }
                
                it("luke 이동 경로 불가능해야 함") {
                    expect { self.ruleBook.isAvailable(with: chess, from: position, to: Position(row: .six, col: .b))}.to(beFalse())
                }
            }
        }
        
    }
}
