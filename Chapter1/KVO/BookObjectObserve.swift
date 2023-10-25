//
//  BookObjectObserve.swift
//
//  Created by satoutakeshi on 2023/10/23.
//

import Foundation

final class BookObjectObserve: NSObject {
    @objc dynamic var isBorrowed: Bool
    init(isBorrowed: Bool) {
        self.isBorrowed = isBorrowed
    }
    func switchBorrow() {
        isBorrowed.toggle()
    }
}
