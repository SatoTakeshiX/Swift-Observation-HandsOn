//
//  SE-0400.swift
//  Chapter1
//
//  Created by satoutakeshi on 2023/11/01.
//

import Foundation

//struct A {
//    var name: String
//
//    init() {} // Return from initializer without initializing all stored properties
//}


// Observableが格納プロパティを書き換えるイメージコード
//final class Person {
//    var _name: String
//    var name: String {
//        get {
//            _name
//        }
//
//        set {
//            _name = newValue
//        }
//    }
//    init(name: String) {
//        self.name = name
//    }
//}

//@Observable
//final class Person {
//    var name: String = ""
//    init() {}
//}

final class Person {
    let age: Int
    let _name: String
    var name: String {
        @storageRestrictions(initializes: _name, accesses: age)
        init(initializes) {
            self._name = initializes
            print(self.age)
        }

        get {
            _name
        }
    }

    init(name: String, age: Int) {
        // self.name = name // Constant 'self.age' used before being initialized
        self.age = age
        self.name = name
    }
}

final class Animal {
    var _age: Int
    var age: Int = 0 { // initial value
        @storageRestrictions(initializes: _age)
        init(initializes) {
            self._age = initializes
            print("called first")
        }

        get {
            _age
        }

        set {
            _age = newValue
            print("called second")
        }
    }

    init(age: Int) {
        // implicitly initializes self.age = 0
        self.age = _age // calls setter
    }
}
