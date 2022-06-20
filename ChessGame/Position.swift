//
//  Position.swift
//  ChessGame
//
//  Created by bean Milky on 2022/06/20.
//

import Foundation

struct Position {
    let row: Row
    let col: Column
}

extension Position {
    enum Row: Int {
        case one = 0, two, three, four, five, six, seven, eight
    }
    
    enum Column: Int {
        case a = 0, b, c, d, e, f, g
    }
}
