//
//  ChessGameAppApp.swift
//  ChessGameApp
//
//  Created by bean Milky on 2022/06/27.
//

import SwiftUI
import ChessGameFramework

@main
struct ChessGameAppApp: App {
    
    @StateObject var chessController: ChessGameController = ChessGameController(ruleBook: ChessRuleBook())

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(chessController)
        }
    }
}

extension ChessGameController: ObservableObject {
}
