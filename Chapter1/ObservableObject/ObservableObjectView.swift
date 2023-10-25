//
//  ObservableObjectView.swift
//  KVOSample
//
//  Created by satoutakeshi on 2023/10/23.
//

import SwiftUI

struct ObservableObjectView: View {
    @StateObject private var model = BookModel()
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 16)
            Image(systemName: "book")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 88)
                .foregroundColor(.blue)
            Spacer()
                .frame(height: 8)
            Text(model.isBorrowed ? "貸出中" : "貸出可能")
            Spacer()
                .frame(height: 16)
            Button {
                model.switchBorrow()
            } label: {
                Text(model.isBorrowed ? "この本を返す" : "この本を借りる")
            }
            Spacer()
        }
    }
}

#Preview {
    ObservableObjectView()
}
