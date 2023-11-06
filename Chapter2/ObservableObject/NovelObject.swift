//
//  NovelObject.swift
//  Chapter2
//
//  Created by satoutakeshi on 2023/11/04.
//

import Foundation

final class NovelObject: BookAccountObject {
    @Published var genre: String

    init(genre: String) {
        self.genre = genre
        super.init()
    }
}
