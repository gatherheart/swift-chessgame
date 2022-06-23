//
//  Utilities.swift
//  ChessGame
//
//  Created by bean Milky on 2022/06/23.
//

import Foundation

extension Dictionary {
    func merge(_ dict: [Key: Value]) -> [Key: Value] {
        var newDict = self
        for (k, v) in dict {
            newDict.updateValue(v, forKey: k)
        }
        return newDict
    }
}
