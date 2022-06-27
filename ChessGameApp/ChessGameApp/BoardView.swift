//
//  BoardView.swift
//  ChessGameApp
//
//  Created by bean Milky on 2022/06/27.
//

import SwiftUI
import ChessGameFramework

struct BoardView: View {
    
    @Binding var items: [[ChessPiece]]
    @Binding var selection: Bool
    @Binding var item: (Position, ChessPiece)?
    var action: () -> Void
    let rows: Int
    let columns: Int
    
    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) { rowIndex in
                HStack {
                    let row = items[rowIndex]
                    ForEach(0..<columns, id: \.self) { colIndex in
                        let item = row[colIndex]
                        Text(item.toString)
                            .frame(width: 30, height: 30)
                            .background(backgroundColor(item))
                            .onTapGesture {
                                let position = Position(row: Position.Row(rawValue: rowIndex)!,
                                                        col: Position.Column(rawValue: colIndex)!)
                                self.selection = true
                                self.item = (position, item)
                                self.action()
                        }
                    }
                }
            }
        }
    }
    
    private func backgroundColor(_ item: ChessPiece) -> Color {
        if item.color == .black {
            return .gray
        } else {
            return .white
        }
    }
}
