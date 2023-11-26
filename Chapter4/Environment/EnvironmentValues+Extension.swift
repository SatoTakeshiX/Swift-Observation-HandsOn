//
//  EnvironmentValues+Extension.swift
//  Swift-Observation-HandsOn
//
//  Created by satoutakeshi on 2023/11/19.
//

import SwiftUI

extension EnvironmentValues {
    var lesson: Lesson {
        get { self[LessonKey.self] }
        set { self[LessonKey.self] = newValue }
    }
}

private struct LessonKey: EnvironmentKey {
    static var defaultValue: Lesson = Lesson(
        name: "初めてのギター",
        participants: [],
        duration: 60
    )
}
