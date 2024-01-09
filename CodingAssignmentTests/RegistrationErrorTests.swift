//
//  RegistrationErrorTests.swift
//  CodingAssignmentTests
//
//  Created by Prethep Paramananthan on 09.01.24.
//

import XCTest
@testable import CodingAssignment

final class RegistrationErrorTests: XCTestCase {
    func testErrorMessageLocalization() {
        XCTAssertEqual(RegistrationError.nameTooShort.localizedMessage, "Der Name muss mindestens ein Zeichen enthalten.")
        XCTAssertEqual(RegistrationError.emailInvalid.localizedMessage, "Die E-Mail-Adresse ist ungültig.")
        XCTAssertEqual(RegistrationError.dateOfBirthOutOfRange.localizedMessage, "Das Geburtsdatum muss zwischen dem 1. Januar 1900 und dem 31. Dezember 2022 liegen.")
    }
}
