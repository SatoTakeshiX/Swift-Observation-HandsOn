//
//  BindableView.swift
//  Swift-Observation-HandsOn
//
//  Created by satoutakeshi on 2023/11/20.
//

import SwiftUI

struct BindableView: View {
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
    @State private var specialLesson = Lesson(
        name: "特別レッスン",
        participants: [],
        duration: 0
    )

    var body: some View {
        List(lessons) { lesson in
            Section(lesson.name) {
                BindableChildView(lesson: lesson)
            }
        }

        TextField("特別レッスン", text: $specialLesson.name)

        @Bindable var environmentLesson = environmentLesson
        TextField("環境値の名前1", text: $environmentLesson.name)

        TextField("環境値の名前2", text: Bindable(environmentLesson).name)

        TextField("特別レッスン", text: Binding(get: {
            specialLesson.name
        }, set: { newValue in
            specialLesson.name = newValue
        }))

        List(lessons) { lesson in
            @Bindable var lesson = lesson
            Section(lesson.name) {
                Text("レッスン時間: \(lesson.duration)分")
                Stepper("時間を変える", value: $lesson.duration)
            }
        }
    }
}

struct BindableChildView: View {
    @Bindable var lesson: Lesson
    var body: some View {
        VStack(alignment: .leading) {
            TextField("変更", text: $lesson.name)
        }
    }
}

#Preview {
    BindableView()
        .environment(
            Lesson(
                name: "デーブルマナーを学ぶ",
                participants: [],
                duration: 60
            )
        )
}
