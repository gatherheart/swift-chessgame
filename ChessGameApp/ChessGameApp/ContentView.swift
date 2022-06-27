//
//  ContentView.swift
//  ChessGameApp
//
//  Created by bean Milky on 2022/06/27.
//

import SwiftUI
import ChessGameFramework

struct ContentView: View {
    
    @StateObject var viewModel = ChessViewModel()
    
    @State var selection: Bool = false
    @State var item: ChessPiece?
    
    var body: some View {
        BoardView(items: $viewModel.items,
                  selection: $selection,
                  item: $item,
                  action: tapped,
                  rows: viewModel.items.count,
                  columns: viewModel.items.count)
    }
    
    private func tapped() {
        print(selection, item)
    }
}

class ChessViewModel: ObservableObject {
    let chessController: ChessGameController
    @Published var board: ChessBoard
    var items: [[ChessPiece]] = []
    
    init() {
        chessController = ChessGameController(ruleBook: ChessRuleBook())
        board = chessController.board
        
        for row in Position.Row.allCases {
            items.append(board[row])
        }
    }
}

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
