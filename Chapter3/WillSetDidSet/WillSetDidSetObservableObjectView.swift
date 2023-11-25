//
//  WillSetDidSetObservableObjectView.swift
//  Chapter3
//
//  Created by satoutakeshi on 2023/11/05.
//

import SwiftUI

fileprivate final class Book: ObservableObject {
    @Published var borrowedName: String {
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

struct WillSetDidSetObservableObjectView: View {
    @StateObject private var book = Book(borrowedName: "貸出可能")
    var body: some View {
        Text(book.borrowedName)
        Button(action: {
            book.borrowedName = ["Jobs", "Cook", "Federighi", "Hausler"].randomElement() ?? "貸出中"
        }, label: {
            Text("借りる")
        })
        Spacer()
    }
}

#Preview {
    WillSetDidSetObservableObjectView()
}
