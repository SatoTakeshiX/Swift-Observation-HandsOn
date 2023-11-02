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
        @storageRestrictions(initializes: _name)
        init(initializes) {
            self._name = initializes
            self.age = 0
        }

        get {
            _name
        }
    }

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

struct Person2 {
    let age: Int
    let _name: String
    var name: String {
        @storageRestrictions(initializes: _name, accesses: age)
        init(initializes) {
            self._name = initializes
            print("age: \(age)")
        }

        get {
            _name
        }
    }

    init(name: String, age: Int) {
        //self.name = name
        self.age = age
        self.name = name
    }
}
