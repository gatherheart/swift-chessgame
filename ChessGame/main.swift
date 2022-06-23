//
//  main.swift
//  ChessGame
//
//  Created by bean Milky on 2022/06/20.
//

import Foundation

func main() -> Void {
    let board = ChessBoard(positions: ChessRuleBook().startPositions())
    print(board)
}

main()
