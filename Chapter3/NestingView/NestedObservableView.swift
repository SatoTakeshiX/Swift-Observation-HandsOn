//
//  NestedObservableView.swift
//  Chapter3
//
//  Created by satoutakeshi on 2023/11/09.
//

import SwiftUI

@Observable
private final class Dice {
    var number: Int

    init(number: Int) {
        self.number = number
    }

    func roll() {
        number = Int.random(in: 1...6)
    }
}

@Observable
private final class Game {
    var dice: Dice = .init(number: 1)
}

struct NestedObservableView: View {
    @State private var game: Game = .init()

    var body: some View {
        Text("サイコロの目: \(game.dice.number)")
        Button(action: {
            game.dice.roll()
        }, label: {
            Text("サイコロをふる")
        })
        Spacer()
    }
}

#Preview {
    NestedObservableView()
}
