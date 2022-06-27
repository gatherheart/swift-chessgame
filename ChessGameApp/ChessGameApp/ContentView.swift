//
//  ContentView.swift
//  ChessGameApp
//
//  Created by bean Milky on 2022/06/27.
//

import SwiftUI
import ChessGameFramework

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
            .onAppear {
                let game = ChessGameController(ruleBook: ChessRuleBook())
                game.start()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
