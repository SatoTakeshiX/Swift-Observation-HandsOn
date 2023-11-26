//
//  Lesson.swift
//  Swift-Observation-HandsOn
//
//  Created by satoutakeshi on 2023/11/19.
//

import Foundation

@Observable
final class Lesson: Identifiable {
    var name: String
    private(set) var participants: [Participant]
    var duration: Int

    var sumNumber: Int {
        participants.count
    }

    init(name: String, 
         participants: [Participant],
         duration: Int
    ) {
        self.name = name
        self.participants = participants
        self.duration = duration
    }

    func addParticipant() {
        let newName = [
            "Jobs",
            "Cook",
            "Federighi",
            "Hausler"
        ]

        guard let name = newName.randomElement() else {
            return
        }

        participants.append(
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
    private(set) var participants: [Participant]
    private(set) var duration: Int

    var sumNumber: Int {
        participants.count
    }

    static let shared: SingletonLesson = {
        let lesson = SingletonLesson(
            name: "ピアノ",
            participants: [],
            duration: 60
        )
        return lesson
    }()

    private init(
        name: String,
        participants: [Participant],
        duration: Int
    ) {
        self.name = name
        self.participants = participants
        self.duration = duration
    }

    func addParticipant() {
        let newName = [
            "Jobs",
            "Cook",
            "Federighi",
            "Hausler"
        ]

        guard let name = newName.randomElement() else {
            return
        }

        participants.append(
            Participant(name: name)
        )
    }
}
