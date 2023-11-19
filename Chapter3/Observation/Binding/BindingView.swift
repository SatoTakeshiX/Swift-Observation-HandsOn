//
//  BindingView.swift
//  Chapter2
//
//  Created by satoutakeshi on 2023/11/04.
//

import SwiftUI

struct ParentView: View {
    @State private var bookAccount = BookAccount2()

    var body: some View {
        let _ = Self._printChanges()
        VStack {
            Text(bookAccount.name)
            ChildView(bookAccount: bookAccount)

            Button(action: {
                bookAccount.name = Int.random(in: 0...1000).description
            }, label: {
                Text("名前変える")
            })
        }
    }
}

struct ChildView: View {
    @Bindable var bookAccount: BookAccount2
    var body: some View {
        let _ = Self._printChanges()
        VStack {
            Text("貸出回数: \(bookAccount.isBorrowed.description)")
            Text("場所: \(bookAccount.place.place)")
            Button(
                action: {
                    bookAccount.isBorrowed.toggle()

                    bookAccount.place.place = Int.random(in: 0...1000).description
                }, label: {
                    Text("借りる")
                }
            )
        }
    }
}

#Preview {
    ParentView()
}
