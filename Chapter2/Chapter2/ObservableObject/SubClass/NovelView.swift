//
//  NovelView.swift
//  Chapter2
//
//  Created by satoutakeshi on 2023/11/04.
//

import SwiftUI

struct NovelView: View {
    @ObservedObject private var novel = NovelObject(genre: "")
    var body: some View {
        let _ = Self._printChanges()
        VStack {
            Text("貸出回数: \(novel.isBorrowed.description)")
            Text(novel.genre)
            Button(
                action: {
                    novel.isBorrowed.toggle()
                    // novel.genre = "小説：\(Int.random(in: 0...100).description)"
                }, label: {
                    Text("借りる")
                }
            )
        }
    }
}

#Preview {
    NovelView()
}


class Model: ObservableObject {
    @Published var items: [SubModel] = []

    func addItems(_ items: [String]) {
        for item in items {
            self.items.append(SubModel(item))
        }
    }
}

class SubModel: ObservableObject, Identifiable {
    let id = UUID()
    @Published var isChecked = false
    @Published var name: String

    init(_ name: String) {
        self.name = name
    }
}

struct ContentViewd: View {
    @ObservedObject private var model = Model()

    var body: some View {
        VStack {
            Button("アイテム追加") {
                model.addItems(["りんご", "ばなな", "みかん"])
            }
            List {
                ForEach(model.items) { item in
                    HStack {
                        Image(systemName: item.isChecked ? "checkmark.rectangle" : "rectangle")
                        Text(item.name)
                        Spacer()
                    }
                    .onTapGesture {
                        item.isChecked.toggle()
                        model.objectWillChange.send()
                    }
                }
            }
        }
    }
}

#Preview {
    ContentViewd()
}
