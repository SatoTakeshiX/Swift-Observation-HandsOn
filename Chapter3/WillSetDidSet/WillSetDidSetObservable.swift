//
//  WillSetDidSetObservable.swift
//  Chapter2
//
//  Created by satoutakeshi on 2023/11/05.
//

import SwiftUI

@Observable
private final class Book2 {
    var borrowedName: String {
        willSet {
            print("willSet")
        }
        didSet {
            print("didSet")
        }
    }

    init(borrowedName: String) {
        self.borrowedName = borrowedName
    }
}

struct WillSetDidSetObservableView: View {
    @State private var book = Book2(borrowedName: "貸出可能")
    var body: some View {
        Text(book.borrowedName)
        Button(action: {
            book.borrowedName = [
                "Jobs",
                "Cook",
                "Federighi",
                "Hausler"
            ].randomElement() ?? "貸出中"
        }, label: {
            Text("借りる")
        })
    }
}

#Preview {
    WillSetDidSetObservableView()
}
