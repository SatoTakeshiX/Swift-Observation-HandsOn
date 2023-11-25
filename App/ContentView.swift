//
//  ContentView.swift
//  Swift-Observation-HandsOn
//
//  Created by satoutakeshi on 2023/11/19.
//

import SwiftUI

struct ContentView: View {
    @State var pianoLesson = Lesson(name: "ピアノ初級", perticipants: [], duration: 60)
    var body: some View {
        NavigationView {
            List {
                Section("Chapter1") {
                    NavigationLink(
                        destination: KVOView()
                            .navigationTitle("KVO") // UIViewController in UIViewControllerRepresentable doesn't work title. so I update the navigation title in SwiftUI side.
                            .navigationBarTitleDisplayMode(.inline)
                    ) {
                        Text("KVO")
                    }
                    NavigationLink(
                        destination: ObservableObjectView()
                    ) {
                        Text("ObservableObject")
                    }
                    NavigationLink(
                        destination: ObservationView()
                    ) {
                        Text("Observation")
                    }

                    NavigationLink(
                        destination: BookAccountView()
                    ) {
                        Text("Observableマクロのコード生成")
                    }
                }
                
                Section("Chapter3") {
                    NavigationLink(
                        destination: ComputedObjectView()
                    ) {
                        Text("ComputedObjectView")
                    }

                    NavigationLink(
                        destination: ComputedObserverView()
                    ) {
                        Text("ComputedObserverView")
                    }

                    NavigationLink(
                        destination: WillSetDidSetObservableObjectView()
                    ) {
                        Text("WillSetDidSetObservableObjectView")
                    }

                    NavigationLink(
                        destination: WillSetDidSetObservableView()
                    ) {
                        Text("WillSetDidSetObservableView")
                    }

                    NavigationLink(
                        destination: SubclassObjectView()
                    ) {
                        Text("SubclassObjectView")
                    }

                    NavigationLink(
                        destination: SubclassObservableView()
                    ) {
                        Text("SubclassObservableView")
                    }

                    NavigationLink(
                        destination: ParentObjectView()
                    ) {
                        Text("ParentObjectView")
                    }

                    NavigationLink(
                        destination: ParentObservableView()
                    ) {
                        Text("ParentObservableView")
                    }

                    NavigationLink(
                        destination: NestedObjectView()
                    ) {
                        Text("NestedObjectView")
                    }

                    NavigationLink(
                        destination: NestedObservableView()
                    ) {
                        Text("NestedObservableView")
                    }
                }

                Section("Chapter4") {
                    NavigationLink(
                        destination: LocalPropertyView()
                    ) {
                        Text("LocalPropertyView")
                    }
                    
                    NavigationLink(
                        destination: PropertyListView()
                    ) {
                        Text("PropertyListView")
                    }

                    NavigationLink(
                        destination: EnvironmentListView()
                    ) {
                        Text("EnvironmentListView")
                    }

                    NavigationLink(
                        destination: BindableView()
                    ) {
                        Text("BindableView")
                    }
                }
            }
            .navigationTitle("Observation入門")
            .scrollContentBackground(.hidden)
            .background(Color(.systemGray6))
        }
        .environment(\.lesson, pianoLesson)
        .environment(Lesson(name: "初めての中国語", perticipants: [], duration: 60))
    }
}

#Preview {
    ContentView()
}
