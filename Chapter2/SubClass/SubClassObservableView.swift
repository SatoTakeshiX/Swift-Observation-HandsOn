//
//  SubClassObservableView.swift
//  Chapter3
//
//  Created by satoutakeshi on 2023/11/10.
//

import SwiftUI

@Observable
fileprivate class Book {
    var borrowedName: String?

    init(borrowedName: String?) {
        self.borrowedName = borrowedName
    }

    func updateBorrowedName() {
        borrowedName = [
            "Jobs",
            "Cook",
            "Federighi",
            "Hausler"].randomElement() ?? "貸出中"
    }
}

@Observable
fileprivate final class Novel: Book {
    let genre: String

    init(genre: String) {
        self.genre = genre
        super.init(borrowedName: nil)
    }
}

struct SubClassObservableView: View {
    @State private var novel: Novel = .init(genre: "SF小説")
    var body: some View {
        Text("ジャンル：\(novel.genre)")
        Text("借りている人：\(novel.borrowedName ?? "なし")")
        Button(action: {
            novel.updateBorrowedName()
        }, label: {
            Text("本を借りる")
        })
        Spacer()
    }
}

#Preview {
    SubClassObservableView()
}
