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
    var body: some View {
        List(lessons) { lesson in
            @Bindable var lesson = lesson
            Section(lesson.name) {
                Text("レッスン時間: \(lesson.duration)")
                Stepper("時間を変える", value: $lesson.duration)
                BindableChildView(lesson: lesson)
            }
        }
    }
}

struct BindableChildView: View {
    @Bindable var lesson: Lesson
    var body: some View {
        HStack {
            TextField("変更", text: $lesson.name)
        }
    }
}

#Preview {
    BindableView()
}
