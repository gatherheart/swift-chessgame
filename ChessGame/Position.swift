//
//  Position.swift
//  ChessGame
//
//  Created by bean Milky on 2022/06/20.
//

import Foundation

public struct Movement: Hashable {
        
    enum Direction: Int, Comparable {
        case up = 0
        case right
        case down
        case left
        
        static func < (lhs: Movement.Direction, rhs: Movement.Direction) -> Bool {
            return lhs.rawValue < rhs.rawValue
        }
    }
    
    let repeatable: Bool
    let directions: [Direction]
    
    static func directions(of direction: Direction, count: Int) -> [Direction] {
        return Array(repeating: direction, count: abs(count))
    }
}

public struct Position: Hashable, Equatable {
    let row: Row
    let col: Column
    
    public static func == (lhs: Position, rhs: Position) -> Bool {
        return lhs.row == rhs.row && lhs.col == rhs.col
    }
    
    public init(row: Row, col: Column) {
        self.row = row
        self.col = col
    }
    
}

public extension Position {
    enum Row: Int, CaseIterable, RangeExpression {
        public typealias Bound = Int
        
        case one = 0, two, three, four, five, six, seven, eight
        
        public init?(rawValue: Int) {
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
        
        var min: Row {
            Row.allCases.first ?? .one
        }
        
        var max: Row {
            Row.allCases.last ?? .eight
        }
        
        public func relative<C>(to collection: C) -> Swift.Range<Int> where C : Collection, Bound == C.Index {
            let start = (collection.startIndex > min.rawValue && collection.startIndex < max.rawValue ) ? collection.startIndex : min.rawValue
            let end = (collection.endIndex < max.rawValue && collection.endIndex > 0) ? collection.endIndex : max.rawValue
            
            return Range<Int>.init(uncheckedBounds: (start, end))
        }

        public func contains(_ element: Int) -> Bool {
            return (Row.one.rawValue ... Row.eight.rawValue).contains(element)
        }
    }
    
    enum Column: Int, CaseIterable {
        case a = 0, b, c, d, e, f, g, h
        
        public init?(rawValue: Int) {
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
        
        var description: String {
            switch self.rawValue {
            case 0: return "a"
            case 1: return "b"
            case 2: return "c"
            case 3: return "d"
            case 4: return "e"
            case 5: return "f"
            case 6: return "g"
            case 7: return "h"
            default: return ""
            }
        }
    }
}
