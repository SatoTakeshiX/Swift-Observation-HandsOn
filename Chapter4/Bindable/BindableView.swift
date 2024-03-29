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

    var body: some View {
        List(lessons) { lesson in
            Section(lesson.name) {
                BindableChildView(lesson: lesson)
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
                name: "テーブルマナーを学ぶ",
                participants: [],
                duration: 60
            )
        )
}
