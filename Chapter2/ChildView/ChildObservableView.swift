//
//  ChildObservableView.swift
//  Chapter3
//
//  Created by satoutakeshi on 2023/11/08.
//

import SwiftUI

@Observable
private class Item: Identifiable {
    var name: String
    var isChecked: Bool

    init(name: String, isChecked: Bool) {
        self.name = name
        self.isChecked = isChecked
    }
}

@Observable
private final class ItemModel {
    var items: [Item] = [
        Item(name: "Apple", isChecked: false),
        Item(name: "Banana", isChecked: false),
        Item(name: "Meron", isChecked: false)
    ]

    init() {}
}

struct ParentObservableView: View {
    @State private var itemModel: ItemModel = .init()
    var body: some View {
        let _ = Self._printChanges()
        List(itemModel.items) { item in
            @Bindable var item = item
            ChildObservableView(
                isChecked: $item.isChecked,
                name: item.name
            )
        }
    }
}

private struct ChildObservableView: View {
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
    ParentObservableView()
}
