//
//  ObservableObjectParentView.swift
//  Chapter2
//
//  Created by satoutakeshi on 2023/11/04.
//

import SwiftUI

struct ObservableObjectParentView: View {
    @StateObject private var bookAccount = BookAccountObject()

    var body: some View {
        let _ = Self._printChanges()
        ObservableObjectChildView(isBorrowed: $bookAccount.isBorrowed)
    }
}

struct ObservableObjectChildView: View {
    @Binding var isBorrowed: Bool
    var body: some View {
        let _ = Self._printChanges()
        VStack {
            Text("貸出回数: \(isBorrowed.description)")
            Button(
                action: {
                    isBorrowed.toggle()
                }, label: {
                    Text("借りる")
                }
            )
        }
    }
}

#Preview {
    ObservableObjectParentView()
}
