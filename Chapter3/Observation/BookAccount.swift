//
//  BookAccount.swift
//  Chapter2
//
//  Created by satoutakeshi on 2023/11/04.
//

import Foundation
import Observation

@Observable
final class BookAccount2 {
    var isBorrowed: Bool = false
    var name: String = ""
    var place: BookShelfPlace2 = .init()
}

@Observable
final class BookShelfPlace2 {
    var place: String = "右から三番目"
}
