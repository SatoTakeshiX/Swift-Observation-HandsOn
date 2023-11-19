//
//  Lesson.swift
//  Swift-Observation-HandsOn
//
//  Created by satoutakeshi on 2023/11/19.
//

import Foundation

@Observable
final class Lesson {
    let name: String
    private(set) var perticipants: [Participant]
    private(set) var duration: Int

    var sumNumber: Int {
        perticipants.count
    }

    init(name: String, 
         perticipants: [Participant],
         duration: Int
    ) {
        self.name = name
        self.perticipants = perticipants
        self.duration = duration
    }

    func addPerticipant() {
        let newName = [
            "Jobs",
            "Cook",
            "Federighi",
            "Hausler"
        ]

        guard let name = newName.randomElement() else {
            return
        }

        perticipants.append(
            Participant(name: name)
        )
    }
}

struct Participant {
    var name: String
}

@Observable
final class SingletonLesson {
    let name: String
    private(set) var perticipants: [Participant]
    private(set) var duration: Int

    var sumNumber: Int {
        perticipants.count
    }

    static let shared: SingletonLesson = {
        let lesson = SingletonLesson(
            name: "ピアノ",
            perticipants: [],
            duration: 60
        )
        return lesson
    }()

    private init(
        name: String,
        perticipants: [Participant],
        duration: Int
    ) {
        self.name = name
        self.perticipants = perticipants
        self.duration = duration
    }

    func addPerticipant() {
        let newName = [
            "Jobs",
            "Cook",
            "Federighi",
            "Hausler"
        ]

        guard let name = newName.randomElement() else {
            return
        }

        perticipants.append(
            Participant(name: name)
        )
    }
}
