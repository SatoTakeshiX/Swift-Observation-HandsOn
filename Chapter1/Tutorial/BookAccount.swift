//
//  BookAccount.swift
//  Chapter1
//
//  Created by satoutakeshi on 2023/10/26.
//

import Foundation
import Observation

@Observable
final class BookAccount {
    var isBorrowed: Bool = false
    var history: [Date: Bool] = [:]
    var borrowedCount: Int {
        history.count
    }
    func switchBorrow() {
        isBorrowed.toggle()
        history = [Date(): isBorrowed]
    }
}
