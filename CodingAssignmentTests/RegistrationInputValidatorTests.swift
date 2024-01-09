//
//  RegistrationInputValidatorTests.swift
//  CodingAssignmentTests
//
//  Created by Prethep Paramananthan on 09.01.24.
//

import XCTest
@testable import CodingAssignment

final class RegistrationInputValidatorTests: XCTestCase {

    func testValidateName() {
        let sut = RegistrationInputValidator()
        // Test valid names
        XCTAssertNil(sut.validateName("J"))
        XCTAssertNil(sut.validateName("John"))

        // Test invalid empty name
        XCTAssertEqual(sut.validateName(""), .nameTooShort)

        // Test invalid whitespace-only name
        XCTAssertEqual(sut.validateName("   "), .nameTooShort)
    }

    func testValidateEmail() {
        let sut = RegistrationInputValidator()

        // Test valid email
        XCTAssertNil(sut.validateEmail("a@b.ch"))

        // Test invalid email without @
        XCTAssertEqual(sut.validateEmail("invalid.email"), .emailInvalid)

        // Test invalid email without dot (.)
        XCTAssertEqual(sut.validateEmail("invalid.email@domain"), .emailInvalid)

        // Test invalid email with missing characters after dot (.)
        XCTAssertEqual(sut.validateEmail("invalid.email@domain."), .emailInvalid)
    }

    func testValidateDateOfBirth() {
        let sut = RegistrationInputValidator()

        // Test valid date of birth
        let validDate = Calendar.current.date(from: DateComponents(year: 2022, month: 12, day: 31, hour: 23, minute: 59, second: 59))!
        XCTAssertNil(sut.validateDateOfBirth(validDate))

        // Test date of birth before lower bound
        let lowerBoundDate = Calendar.current.date(from: DateComponents(year: 1800, month: 1, day: 1))!
        XCTAssertEqual(sut.validateDateOfBirth(lowerBoundDate), .dateOfBirthOutOfRange)

        // Test date of birth after upper bound
        let upperBoundDate = Calendar.current.date(from: DateComponents(year: 2100, month: 1, day: 1))!
        XCTAssertEqual(sut.validateDateOfBirth(upperBoundDate), .dateOfBirthOutOfRange)
    }
}
