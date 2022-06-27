//
//  ContentView.swift
//  ChessGameApp
//
//  Created by bean Milky on 2022/06/27.
//

import SwiftUI
import ChessGameFramework

struct ContentView: View {
    
    
    @State var selection: Bool = false
    @State var item: (Position, ChessPiece)?
    @State var previousItem: (Position, ChessPiece)?
    @EnvironmentObject var gameController: ChessGameController

    @StateObject var viewModel = ChessViewModel()

    var body: some View {
        BoardView(items: $viewModel.items,
                  selection: $selection,
                  item: $item,
                  action: tapped,
                  rows: viewModel.items.count,
                  columns: viewModel.items.count)
        .onAppear {
            viewModel.gameController = gameController
        }
    }
    
    private func tapped() {
        
        guard let (position, chess) = item else { return }
        guard let previousItem = previousItem else {
            previousItem = item
            return
        }
        
        
        // chess and move
        if chess.type == ChessPiece.PieceType.none,
           previousItem.1.type != ChessPiece.PieceType.none {
            
            gameController.board.set(piece: previousItem.1, from: previousItem.0, to: position)
            
        }
        
        
        self.previousItem = item
    }
}

class ChessViewModel: ObservableObject {
    @Published var board: ChessBoard? {
        didSet {
            self.setBoard()
        }
    }
    var gameController: ChessGameController? {
        didSet {
            self.board = gameController?.board
        }
    }
    var items: [[ChessPiece]] = []

    private func setBoard() {
        for row in Position.Row.allCases {
            items.append(board![row])
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
