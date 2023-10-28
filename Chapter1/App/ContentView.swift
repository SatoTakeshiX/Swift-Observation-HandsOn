//
//  ContentView.swift
//  Chapter1
//
//  Created by satoutakeshi on 2023/10/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                Section("オブザーバーパターン") {
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
                }

                Section("Observation基礎") {
                    NavigationLink(
                        destination: TutorialView()
                    ) {
                        Text("チュートリアル")
                    }
                }
            }
            .navigationTitle("Chapter 1")
            .scrollContentBackground(.hidden)
            .background(Color(.systemGray5))
        }
    }
}

#Preview {
    ContentView()
}
