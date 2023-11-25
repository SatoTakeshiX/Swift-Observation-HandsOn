//
//  PropertyWrappers.swift
//  Chapter3
//
//  Created by satoutakeshi on 2023/11/06.
//

import SwiftUI

@propertyWrapper
struct CustomWrapper<Value> {
    var wrappedValue: Value
}

//private final class PropertyWrapperObject: ObservableObject {
//    @CustomWrapper
//    @Published var name: String = ""
//}

@Observable
private final class PropertyWrapperObservable {
    @CustomWrapper
    @ObservationIgnored
    var name: String = ""
}

