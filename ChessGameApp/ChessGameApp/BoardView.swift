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
    @Binding var item: ChessPiece?
    var action: () -> Void
    let rows: Int
    let columns: Int
    
    var body: some View {
        List {
            ForEach(items, id: \.self) { row in
                HStack {
                    ForEach(row, id: \.self) { item in
                        Text(item.toString)
                            .frame(width: 30, height: 30)
                            .background(backgroundColor(item))
                            .onTapGesture {
                                self.selection = true
                                self.item = item
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
