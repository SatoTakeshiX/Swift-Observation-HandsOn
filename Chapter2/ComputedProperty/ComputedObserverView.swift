//
//  ComputedObserverView.swift
//  Chapter2
//
//  Created by satoutakeshi on 2023/11/06.
//

import SwiftUI

@Observable
private class Book {
    var name: String? {
        return UserDefaults.standard.string(forKey: "bookName") ?? "名無し"
    }

    @ObservationIgnored var count: Int = 0

    var doubleCount: Int {
        count * 2
    }

    func update() {
        let name = ["Swift入門", "iPhoneの使い方", "iPadの使い方"].randomElement()
        UserDefaults.standard.set(name, forKey: "bookName")

        print(self.name)

        count = count + 1
    }
}

struct ComputedObserverView: View {
    @State private var book = Book()

    var body: some View {
        Text(book.name ?? "")
        Text(book.doubleCount.description)

        Button(action: {
            book.update()
        }, label: {
            Text("名前を変える")
        })
    }
}

#Preview {
    ComputedObserverView()
}
