//
//  ObservationUsage.swift
//  Chapter2
//
//  Created by satoutakeshi on 2023/11/05.
//

import Foundation
/**
@Observable
struct StructA {}

@Observable
enum EnumA {}

@Observable
actor ActorA {}
 */

@Observable
class ClassA {}

// struct StructObject: ObservableObject {}
// Non-class type 'StructObject' cannot conform to class protocol 'ObservableObject'

// enum EnumObject: ObservableObject {}
// Non-class type 'EnumObject' cannot conform to class protocol 'ObservableObject'

class ClassAObject: ObservableObject {}
