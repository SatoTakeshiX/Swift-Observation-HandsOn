//
//  OtherBindingView.swift
//  Swift-Observation-HandsOn
//
//  Created by satoutakeshi on 2024/02/04.
//

import SwiftUI

struct OtherBindingView: View {
    @State private var specialLesson = Lesson(
        name: "特別レッスン",
        participants: [],
        duration: 0
    )

    var body: some View {
        List {
            TextField("特別レッスン", text: $specialLesson.name)
            TextField("特別レッスン", text: Binding(get: {
                specialLesson.name
            }, set: { newValue in
                specialLesson.name = newValue
            }))
        }
    }
}

#Preview {
    OtherBindingView()
}
