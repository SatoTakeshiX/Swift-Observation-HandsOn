//
//  BookObserver.swift
//  Chapter1
//
//  Created by satoutakeshi on 2023/10/26.
//

import SwiftUI

struct ObservationView: View {
    @State private var book = Book()
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
            Text(book.isBorrowed ? "貸出中" : "貸出可能")
            Spacer()
                .frame(height: 16)
            Button {
                book.switchBorrow()
            } label: {
                Text(book.isBorrowed ? "この本を返す" : "この本を借りる")
                    .padding()
                    .foregroundStyle(Color.black)
                    .overlay(
                        RoundedRectangle(cornerRadius: 24)
                            .stroke(Color(.black), lineWidth: 2.0)
                    )
            }
            Spacer()
        }
    }
}

#Preview {
    ObservationView()
}
