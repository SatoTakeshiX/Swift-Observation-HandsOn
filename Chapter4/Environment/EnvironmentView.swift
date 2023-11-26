//
//  EnvironmentView.swift
//  Swift-Observation-HandsOn
//
//  Created by satoutakeshi on 2023/11/19.
//

import SwiftUI

struct EnvironmentListView: View {
    @State private var lessonState: Lesson = .init(
        name: "英語初級",
        participants: [], 
        duration: 90
    )

    var body: some View {
        List {
            NavigationLink(
                destination: SecondStateView(lesson: lessonState)
            ) {
                Text("SecondStateView")
            }

            NavigationLink(
                destination: SecondEnvironmentView()
            ) {
                Text("EnvironmentListView")
            }
        }
    }
}

struct SecondStateView: View {
    var lesson: Lesson
    var body: some View {
        ThirdStateView(lesson: lesson)
    }
}

struct ThirdStateView: View {
    var lesson: Lesson

    var body: some View {
        Text(lesson.name)
        Spacer()
    }
}

struct SecondEnvironmentView: View {
    var body: some View {
        ThirdEnvironmentView()
    }
}

struct ThirdEnvironmentView: View {
    @Environment(\.lesson) private var lessonByEnvironmentKey
    @Environment(Lesson.self) private var lessonByType

    // オプショナルとして定義も可能
    // @Environment(Lesson.self) private var lessonByType: Lesson?

    var body: some View {
        Text("by key: \(lessonByEnvironmentKey.name)")
        Text("by Type: \(lessonByType.name)")
        Spacer()
    }
}

#Preview {
    let lesson = Lesson(name: "ピアノ初級", participants: [], duration: 60)
    return NavigationView(
        content: {
            NavigationLink(
                destination: EnvironmentListView()

            ) {
                Text("EnvironmentListView")
            }
        }
    )
    .environment(\.lesson, lesson)
    .environment(Lesson(name: "初めての中国語", participants: [], duration: 60))
}
