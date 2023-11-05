//
//  BookAccount.swift
//  Chapter2
//
//  Created by satoutakeshi on 2023/11/04.
//

import Foundation
import Observation

@Observable
final class BookAccount {
    var isBorrowed: Bool = false
    var name: String = ""
    var place: BookShelfPlace = .init()
}

@Observable
final class BookShelfPlace {
    var place: String = "右から三番目"
}
