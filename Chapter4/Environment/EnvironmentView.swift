//
//  EnvironmentView.swift
//  Swift-Observation-HandsOn
//
//  Created by satoutakeshi on 2023/11/19.
//

import SwiftUI

struct EnvironmentListView: View {
    @State private var lesson: Lesson = .init(
        name: "英語初級",
        perticipants: [], 
        duration: 90
    )
    var body: some View {
        List {
            NavigationLink(
                destination: EnvironmentListView()
            ) {
                Text("EnvironmentListView")
            }

            NavigationLink(
                destination: SecondStateView(lesson: lesson)
            ) {
                Text("SecondStateView")
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

struct SecondEnvironmentView {
    
}

struct ThirdEnvironmentView {

}



#Preview {
    NavigationView(
        content: {
            NavigationLink(
                destination: EnvironmentListView()
            ) {
                Text("EnvironmentListView")
            }
        }
    )
}
