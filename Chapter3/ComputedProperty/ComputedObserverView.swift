//
//  ComputedObserverView.swift
//  Chapter3
//
//  Created by satoutakeshi on 2023/11/06.
//

import SwiftUI

@Observable
private final class Counter {
    /*@ObservationIgnored*/ var count: Int = 0

    var doubleCount: Int {
        count * 2
    }

    func update() {
        count = count + 1
    }
}

struct ComputedObserverView: View {
    @State private var counter = Counter()
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
    ComputedObserverView()
}
