//
//  ChildObjectView.swift
//  Chapter3
//
//  Created by satoutakeshi on 2023/11/07.
//

import SwiftUI

private struct Item: Identifiable {
    var name: String
    var isChecked: Bool
    var id: String {
        name
    }

    init(name: String, isChecked: Bool) {
        self.name = name
        self.isChecked = isChecked
    }
}

private final class ItemModel: ObservableObject {
    @Published var items: [Item] = [
        Item(name: "Apple", isChecked: false),
        Item(name: "Banana", isChecked: false),
        Item(name: "Meron", isChecked: false)
    ]
    
    init() {}
}

struct ParentObjectView: View {
    @StateObject private var itemModel: ItemModel = .init()
    var body: some View {
        let _ = Self._printChanges()
        List(itemModel.items.indices, id: \.self) { index in
            ChildObjectView(
                isChecked: $itemModel.items[index].isChecked,
                name: itemModel.items[index].name
            )
        }

    }
}

private struct ChildObjectView: View {
    @Binding var isChecked: Bool
    var name: String
    var body: some View {
        let _ = Self._printChanges()

        Toggle(isOn: $isChecked, label: {
            Text(name)
        })
    }
}

#Preview {
    ParentObjectView()
}
