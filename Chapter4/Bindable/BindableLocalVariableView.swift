//
//  BindableLocalVariableView.swift
//  Swift-Observation-HandsOn
//
//  Created by satoutakeshi on 2024/02/04.
//

import SwiftUI

struct BindableLocalVariableView: View {
    @State private var lessons = [
        Lesson(
            name: "初めての料理教室",
            participants: [],
            duration: 120
        ),
        Lesson(
            name: "初めてのワイン",
            participants: [],
            duration: 45
        )
    ]

    @Environment(Lesson.self) private var environmentLesson

    var body: some View {
        List(lessons) { lesson in
            @Bindable var lesson = lesson
            Section(lesson.name) {
                Text("レッスン時間: \(lesson.duration)分")
                Stepper("時間を変える", value: $lesson.duration)
            }
        }

        @Bindable var environmentLesson = environmentLesson
        List {
            TextField("環境値の名前1", text: $environmentLesson.name)
            TextField("環境値の名前2", text: Bindable(environmentLesson).name)
        }
    }
}

#Preview {
    BindableLocalVariableView()
        .environment(
            Lesson(
                name: "テーブルマナーを学ぶ",
                participants: [],
                duration: 60
            )
        )
}
