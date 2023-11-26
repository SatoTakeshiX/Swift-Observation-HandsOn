//
//  PropertyView.swift
//  Swift-Observation-HandsOn
//
//  Created by satoutakeshi on 2023/11/19.
//

import SwiftUI

struct PropertyListView: View {
    @State private var isShow: Bool = false
    var body: some View {
        let _ = Self._printChanges()
        LocalPropertyView()
        Toggle(isOn: $isShow) {
            Text("親Viewの値を変更")
        }
        .padding()
        Spacer()
    }
}

struct LocalPropertyView: View {
    var lesson: Lesson = .init(
        name: "ピアノ",
        participants: [],
        duration: 60
    )

    var body: some View {
        let _ = Self._printChanges()
        Text("レッスン：\(lesson.name)")
            .font(.title)
        Text("参加者人数: \(lesson.numberOfParticipants)")
        Spacer()
            .frame(height: 12)
        Button(action: {
            lesson.addParticipant()
        }, label: {
            Text("参加者を増やす")
        })
        Button(action: {
            lesson.duration = Int.random(in: 30...60)
        }, label: {
            Text("レッスン時間を変える")
        })
        Spacer()
            .frame(height: 8)
    }
}

struct LocalPropertyParent: View {
    @State var lesson = Lesson(
        name: "英語",
        participants: [],
        duration: 60
    )
    var body: some View {
        LocalPropertyChild(lesson: lesson)
    }
}

struct LocalPropertyChild: View {
    let lesson: Lesson

    var body: some View {
        Text(lesson.name)
    }
}

#Preview {
    LocalPropertyView()
}

#Preview {
    PropertyListView()
}
