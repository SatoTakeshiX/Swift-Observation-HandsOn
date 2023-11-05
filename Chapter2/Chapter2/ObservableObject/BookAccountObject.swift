//
//  BookAccountObject.swift
//  Chapter2
//
//  Created by satoutakeshi on 2023/11/04.
//

import Combine
import Foundation

class BookAccountObject: ObservableObject {
    @Published var isBorrowed: Bool = false
    @Published var history: [Date: Bool] = [:]
    var borrowedCount: Int {
        history.filter { $0.value }.count
    }
    func switchBorrow() {
        isBorrowed.toggle()
        history[Date()] = isBorrowed
    }
}
