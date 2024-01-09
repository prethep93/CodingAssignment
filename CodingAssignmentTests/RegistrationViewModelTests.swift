//
//  RegistrationViewModelTests.swift
//  CodingAssignmentTests
//
//  Created by Prethep Paramananthan on 09.01.24.
//

import XCTest
@testable import CodingAssignment

final class RegistrationViewModelTests: XCTestCase {
    let validDate = Calendar.current.date(from: DateComponents(year: 2022, month: 12, day: 31, hour: 23, minute: 59, second: 59))!

    @MainActor func testInitialValues() throws {
        let sut = RegistrationView.ViewModel()
        XCTAssertEqual(sut.userProfile.name, UserProfile().name)
        XCTAssertEqual(sut.userProfile.email, UserProfile().email)
        XCTAssertEqual(sut.userProfile.dateOfBirth.formatted(date: .numeric, time: .omitted),
                       UserProfile().dateOfBirth.formatted(date: .numeric, time: .omitted))
        XCTAssert(sut.errorMessages.isEmpty)
    }

    @MainActor func testValidateInputFields() {
        let sut = RegistrationView.ViewModel()
        sut.userProfile.name = "John Doe"

        // Test validation with valid input
        sut.userProfile.name = "John Doe"
        sut.userProfile.email = "john@example.com"
        sut.userProfile.dateOfBirth = validDate

        let validationResult = sut.validateInputFields()
        XCTAssert(validationResult)
        XCTAssertEqual(sut.errorMessages, [])

        // Test validation with invalid input
        sut.userProfile.name = ""
        sut.userProfile.email = "invalid.email"
        sut.userProfile.dateOfBirth = Date.distantPast

        let invalidValidationResult = sut.validateInputFields()
        XCTAssertFalse(invalidValidationResult)
        XCTAssertEqual(sut.errorMessages.count, 3)
        XCTAssertEqual(sut.errorMessages[0], "Der Name muss mindestens ein Zeichen enthalten.")
        XCTAssertEqual(sut.errorMessages[1], "Die E-Mail-Adresse ist ungültig.")
        XCTAssertEqual(sut.errorMessages[2], "Das Geburtsdatum muss zwischen dem 1. Januar 1900 und dem 31. Dezember 2022 liegen.")
     }

    @MainActor func testSavingUserData() throws {
        let sut = RegistrationView.ViewModel()
        sut.userProfile.name = "John Doe"
        sut.userProfile.email = "john@example.com"
        sut.userProfile.dateOfBirth = validDate
        sut.saveUserProfile()

        let savedData = UserDefaults.standard.data(forKey: "com.pp.CodingAssignment.registration.userProfile")
        XCTAssertNotNil(savedData)

        let decoder = JSONDecoder()
        if let decodedUserProfile = try? decoder.decode(UserProfile.self, from: savedData!) {
            XCTAssertEqual(decodedUserProfile, sut.userProfile)
        } else {
            XCTFail("Failed to decode saved user data.")
        }
    }
}
