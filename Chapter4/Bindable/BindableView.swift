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
            perticipants: [],
            duration: 120
        ),
        Lesson(
            name: "初めてのワイン",
            perticipants: [],
            duration: 45
        )
    ]

    @Environment(Lesson.self) private var environmentLesson

    var body: some View {
        List(lessons) { lesson in
            Section(lesson.name) {
                BindableChildView(lesson: lesson)
            }
        }

        @Bindable var environmentLesson = environmentLesson
        TextField("環境値の名前1", text: $environmentLesson.name)

        TextField("環境値の名前2", text: Bindable(environmentLesson).name)

        TextField("環境値の名前3", text: .init(get: {
            environmentLesson.name
        }, set: { newValue in
            environmentLesson.name = newValue
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
                perticipants: [],
                duration: 60
            )
        )
}
