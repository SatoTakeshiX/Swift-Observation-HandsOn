//
//  ComputedObjectView.swift
//  Chapter2
//
//  Created by satoutakeshi on 2023/11/06.
//

import SwiftUI

final class Book2: ObservableObject {
    var history: [Date] = []
    @Published var isBoorwwed: Bool = false
    var count: Int {
       // objectWillChange.send()
        return history.count
    }

    func update() {
        history.append(Date())
    }
}
struct ComputedObjectView: View {
    @StateObject private var book = Book2()

    var body: some View {
        ChildView2(count: book.count)
        Button(action: {
            book.update()
        }, label: {
            Text("借りる")
        })
    }
}

struct ChildView2: View {
    var count: Int
    var body: some View {
        Text("貸出回数: \(count)")
    }
}

#Preview {
    ComputedObjectView()
}
