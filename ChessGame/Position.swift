//
//  Position.swift
//  ChessGame
//
//  Created by bean Milky on 2022/06/20.
//

import Foundation

struct Position: Hashable {
    let row: Row
    let col: Column
}

extension Position {
    enum Row: Int, CaseIterable {
        case one = 0, two, three, four, five, six, seven, eight
        
        init?(rawValue: Int) {
            switch rawValue {
            case 0: self = .one
            case 1: self = .two
            case 2: self = .three
            case 3: self = .four
            case 4: self = .five
            case 5: self = .six
            case 6: self = .seven
            case 7: self = .eight
            default: return nil
            }
        }
    }
    
    enum Column: Int {
        case a = 0, b, c, d, e, f, g, h
        
        init?(rawValue: Int) {
            switch rawValue {
            case 0: self = .a
            case 1: self = .b
            case 2: self = .c
            case 3: self = .d
            case 4: self = .e
            case 5: self = .f
            case 6: self = .g
            case 7: self = .h
            default: return nil
            }
        }
    }
}
