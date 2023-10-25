//
//  Book.swift
//  Chapter1
//
//  Created by satoutakeshi on 2023/10/26.
//

import Observation

@Observable
final class Book {
    var isBorrowed: Bool = false
    func switchBorrow() {
        isBorrowed.toggle()
    }
}
