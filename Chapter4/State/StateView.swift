//
//  StateView.swift
//  Swift-Observation-HandsOn
//
//  Created by satoutakeshi on 2023/11/19.
//

import SwiftUI

struct StateParentView: View {
    @State private var isShow: Bool = false
    var body: some View {
        let _ = Self._printChanges()
        // if isShow {
            StateView()
        // }
        Toggle(isOn: $isShow) {
            Text("親Viewの値を変更")
        }
        .padding()
        Spacer()
    }
}

struct StateView: View {
    @State private var lesson: Lesson = .init(
        name: "ピアノ",
        perticipants: [],
        duration: 60
    )

    var body: some View {
        let _ = Self._printChanges()
        Text("レッスン：\(lesson.name)")
            .font(.title)
        Text("参加者人数: \(lesson.sumNumber)")

        Button(action: {
            lesson.addPerticipant()
        }, label: {
            Text("参加者を増やす")
        })
    }
}

#Preview {
    StateParentView()
}