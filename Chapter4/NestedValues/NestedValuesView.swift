//
//  NestedValuesView.swift
//  Swift-Observation-HandsOn
//
//  Created by satoutakeshi on 2023/11/21.
//

import SwiftUI

@Observable
final class House {
    var furniture: Furniture
    var room: Room
    var address: Address

    init(furniture: Furniture, room: Room, address: Address) {
        self.furniture = furniture
        self.room = room
        self.address = address
    }
}

@Observable
final class Furniture {
    var name: String
    var amount: Int

    init(name: String, amount: Int) {
        self.name = name
        self.amount = amount
    }
}

final class Room {
    var name: String
    var size: Int

    init(name: String, size: Int) {
        self.name = name
        self.size = size
    }
}

struct Address {
    var prefecture: String
    var city: String
}


struct NestedValuesView: View {
    var house: House
    var body: some View {
        let _ = Self._printChanges()
        Text("家具: \(house.furniture.name)")
        Text("部屋: \(house.room.name)")
        Text("都市名: \(house.address.city)")

        Spacer()
            .frame(height: 12)

        Button(
            action: {
                house.furniture.name = "ベッド"
            },
            label: {
                Text("家具名を変える")
            }
        )

        Button(
            action: {
                house.furniture.amount = 3
            },
            label: {
                Text("家具の数を変える")
            }
        )

        Button(
            action: {
                house.room.name = "台所"
            },
            label: {
                Text("部屋を変える")
            }
        )

        Button(
            action: {
                house.room.size = 15
            },
            label: {
                Text("部屋のサイズを変える")
            }
        )

        Button(
            action: {
                house.address.prefecture = "宮城県"
            },
            label: {
                Text("住所の県を変える")
            }
        )

        Button(
            action: {
                house.address.city = "仙台市"
            },
            label: {
                Text("住所の都市を変える")
            }
        )
    }
}

#Preview {
    NestedValuesView(
        house: .init(
            furniture: .init(
                name: "机", amount: 2
            ),
            room: .init(
                name: "書斎", size: 20
            ),
            address: .init(
                prefecture: "東京都",
                city: "六本木"
            )
        )
    )
}
