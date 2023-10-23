//
//  ObservableObjectView.swift
//  KVOSample
//
//  Created by satoutakeshi on 2023/10/23.
//

import SwiftUI

final class BookModel: ObservableObject {
    @Published var isBorrowed: Bool = false
    func switchBorrow() {
        isBorrowed.toggle()
    }
}

struct ObservableObjectView: View {
    @StateObject private var model = BookModel()
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 16)
            Image(systemName: "book")
                .resizable()
                .aspectRatio(1.0, contentMode: .fit)
                .frame(width: 88, height: 88)
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
