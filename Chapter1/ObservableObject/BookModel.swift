//
//  BookModel.swift
//  Chapter1
//
//  Created by satoutakeshi on 2023/10/25.
//

import Foundation

final class BookModel: ObservableObject {
    @Published var isBorrowed: Bool = false
    func switchBorrow() {
        isBorrowed.toggle()
    }
}
