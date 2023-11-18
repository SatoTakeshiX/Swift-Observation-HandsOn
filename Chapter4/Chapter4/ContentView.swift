//
//  ContentView.swift
//  Chapter4
//
//  Created by satoutakeshi on 2023/11/18.
//

import SwiftUI

struct ContentView: View {
    @State private var isShow = false
    var body: some View {
        VStack {
            let _ = Self._printChanges()
            //if isShow {
                ParentView()
           // }
            Text(isShow.description)

            Button(action: {
                isShow.toggle()
            }, label: {
                Text("toggle shows")
            })
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

@Observable
final class Counter {
    var number: Int = 0
    var person: Person = Person(name: "no name", age: 18)

    deinit {
        print("deinit")
    }

    init() {
        print("init")
    }
}

@Observable
final class Book {
    var name: String
    init(name: String) {
        self.name = name
        print("init Book")
    }

    deinit {
        print("deinit: Book")
    }
}


struct Person {
    var name: String
    var age: Int
}
struct ParentView: View {
    @State private var book = Book(name: "apple")

    @State private var isShow = false
    var body: some View {
        let _ = Self._printChanges()
        ChildView(book: book)
            .environment(Counter())
        // environment修飾子をかけたviewが消えたらデータモデルも消える

        Toggle(isOn: .init(get: {
            isShow
        }, set: { newValue in
            isShow = newValue
        }), label: {
            Text("ParentViewのisshow更新")
        })
    }
}

@Observable
final class Car {
    var name: String

    init(name: String) {
        self.name = name
        print("car init")
    }

    deinit {
        print("car deinit")
    }

}


struct ChildView: View {
    @Environment(Counter.self) private var counter
    var car: Car = .init(name: "Toyota")
    /*@Bindable*/ var book: Book
    var body: some View {
        let _ = Self._printChanges()
        Text("child: counter \(counter.number)")
        Text("name: \(counter.person.name)")
        Text("book: \(book.name)")
        Text("car: \(car.name)")
        // 入れ子でも、observableなクラスが別の型をもっていてそれを更新しても検知してくれる

        //TextField("入力", text: $book.name)

        Button(action: {
            counter.person.name = "swift"
            book.name = "book"
            counter.person.age = 13

        }, label: {
            Text("change tne name")
        })
    }
}
