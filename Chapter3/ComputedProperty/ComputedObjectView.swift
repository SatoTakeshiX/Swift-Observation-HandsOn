//
//  ComputedObjectView.swift
//  Chapter2
//
//  Created by satoutakeshi on 2023/11/06.
//

import SwiftUI

private final class Counter: ObservableObject {
    @Published var count: Int = 0

    var doubleCount: Int {
        count * 2
    }

    func update() {
        count = count + 1
    }
}

struct ComputedObjectView: View {
    @StateObject private var counter = Counter()

    var body: some View {
        Text(counter.doubleCount.description)

        Button(action: {
            counter.update()
        }, label: {
            Text("カウントアップ")
        })
        Spacer()
    }
}

#Preview {
    ComputedObjectView()
}
