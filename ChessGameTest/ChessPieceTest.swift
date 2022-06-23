//
//  ChessBoardTest.swift
//  ChessGameTest
//
//  Created by bean Milky on 2022/06/23.
//

import Quick
import Nimble
@testable import ChessGame

class ChessPieceSepc: QuickSpec {
    
    let pieceTypes: [ChessPiece.PieceType] = [.luke, .knight, .bishop, .none, .queen, .bishop, .knight, .luke]
    let points: [ChessPiece.PieceType: Int] = [.queen: 9,
                                               .luke: 5,
                                               .knight: 3,
                                               .bishop: 3,
                                               .pawn: 1,
                                               .none: 0]
    override func spec() {
        describe("piece type 별 생성 테스트") {
            context("piece type에 대한 ChessPiece 생성") {
            
                for type in self.pieceTypes {
                    
                    let piece = ChessPiece(type: type, color: .black)
                    
                    it("piece type에 맞는 chess piece 생성되어야 함") {
                        expect(piece.type).to(equal(type))
                    }
                    
                    it("black chess piece가 생성되어야 함") {
                        if type != .none {
                            expect(piece.isBlack).to(beTrue())
                        } else {
                            expect(piece.isBlack).to(beFalse())
                        }
                    }
                    
                    it("chess piece에 맞는 점수여야 함") {
                        expect(piece.point).to(equal(self.points[type]))
                    }
                }
            }
        }
    }
}
