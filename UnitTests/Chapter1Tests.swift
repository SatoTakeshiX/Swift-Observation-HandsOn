//
//  Chapter1Tests.swift
//  Chapter1Tests
//
//  Created by satoutakeshi on 2023/11/02.
//

import XCTest
@testable import Swift_Observation_HandsOn

final class Chapter1Tests: XCTestCase {
    func testTrackingStoredProperty() {
        let book = BookAccount()
        let exp = XCTestExpectation()

        withObservationTracking {
            print(book.isBorrowed)
        } onChange: {
            exp.fulfill()
        }

        book.isBorrowed = true
        wait(for: [exp], timeout: 0.5)
    }

    func testTrackingComputedProperty() {
        let book = BookAccount()
        let exp = XCTestExpectation()

        withObservationTracking {
            print(book.borrowedCount)
        } onChange: {
            exp.fulfill()
        }

        book.history[Date()] = true
        wait(for: [exp], timeout: 0.5)
    }

    func testNotTracking() {
        let book = BookAccount()
        let exp = XCTestExpectation()
        exp.isInverted = true

        withObservationTracking {
            print(book.isBorrowed)
        } onChange: {
            // no one call this
            exp.fulfill()
        }

        book.history[Date()] = false
        wait(for: [exp], timeout: 0.5)
    }
}
