//
//  NestedObjectView.swift
//  Chapter3
//
//  Created by satoutakeshi on 2023/11/08.
//

import SwiftUI

// クラスで定義するとGame.diceが通知されない
//private final class Dice: ObservableObject {
//    @Published var number: Int
//
//    init(number: Int) {
//        self.number = number
//    }
//
//    func roll() {
//        number = Int.random(in: 1...6)
//    }
//}

private struct Dice {
    var number: Int

    mutating func roll() {
        number = Int.random(in: 1...6)
    }
}

private final class Game: ObservableObject {
    @Published var dice: Dice = .init(number: 1)
}

struct NestedObjectView: View {
    @StateObject private var game: Game = .init()

    var body: some View {
        Text("サイコロの目: \(game.dice.number)")
        Button(action: {
            game.dice.roll()
            game.objectWillChange.send()
            // もしもインスタンス全体を更新すれば更新される
            // game.dice = Dice(number: 6)
        }, label: {
            Text("サイコロをふる")
        })
        Spacer()
    }
}

#Preview {
    NestedObjectView()
}
