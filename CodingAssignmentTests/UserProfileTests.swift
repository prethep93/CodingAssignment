//
//  UserProfileTests.swift
//  CodingAssignmentTests
//
//  Created by Prethep Paramananthan on 09.01.24.
//

import XCTest
@testable import CodingAssignment

final class UserProfileTests: XCTestCase {
    func testDefaultInitializer() {
        let sut = UserProfile()
        XCTAssertEqual(sut.name, "")
        XCTAssertEqual(sut.email, "")
        // Ensure the default dateOfBirth is as expected
        XCTAssertEqual(sut.dateOfBirth.formatted(date: .numeric, time: .omitted), Date().formatted(date: .numeric, time: .omitted))
    }

    func testCustomInitializer() {
        let dateOfBirth = Date()
        let sut = UserProfile(name: "John", email: "john@example.com", dateOfBirth: dateOfBirth)
        XCTAssertEqual(sut.name, "John")
        XCTAssertEqual(sut.email, "john@example.com")
        XCTAssertEqual(sut.dateOfBirth, dateOfBirth)
    }
}
