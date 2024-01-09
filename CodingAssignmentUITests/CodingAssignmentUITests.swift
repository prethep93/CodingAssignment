//
//  CodingAssignmentUITests.swift
//  CodingAssignmentUITests
//
//  Created by Prethep Paramananthan on 09.01.24.
//

import XCTest

final class CodingAssignmentUITests: XCTestCase {
    func testRegistrationFlow() throws {
        let app = XCUIApplication()
        app.launch()

        // Verify initial UI state
        XCTAssert(app.navigationBars["Registrierung"].exists)
        XCTAssert(app.textFields["Name"].exists)
        XCTAssert(app.textFields["E-Mail"].exists)
        XCTAssert(app.datePickers["Geburtsdatum"].exists)
        XCTAssert(app.buttons["Registrieren"].exists)

        // Enter valid data
        app.textFields["Name"].tap()
        app.textFields["Name"].typeText("John Doe")

        app.textFields["E-Mail"].tap()
        app.textFields["E-Mail"].typeText("john@example.com")

        app.keyboards.buttons["Return"].tap()

        // Set a valid date of birth
        let dateOfBirthPicker = app.datePickers["Geburtsdatum"]
        XCTAssert(dateOfBirthPicker.exists)
        dateOfBirthPicker.buttons["Show year picker"].tap()
        dateOfBirthPicker.pickerWheels["2024"].adjust(toPickerWheelValue: "2000")

        // Tap the Register button
        app.buttons["Registrieren"].tap()

        // Wait for the ConfirmationView to appear
        XCTAssert(app.navigationBars["Bestätigung"].waitForExistence(timeout: 5))

        // Additional verifications based on the ConfirmationView
        XCTAssert(app.staticTexts["Danke für die Registrierung"].exists)
        XCTAssert(app.images["CHECKMARK_ICON"].firstMatch.exists)
        XCTAssert(app.staticTexts["Name"].exists)
        XCTAssert(app.staticTexts["John Doe"].exists)
        XCTAssert(app.staticTexts["E-Mail"].exists)
        XCTAssert(app.staticTexts["john@example.com"].exists)
        XCTAssert(app.staticTexts["Date of birth"].exists)
        XCTAssert(app.staticTexts["9.1.2000"].exists)

        // Navigating back
        app.navigationBars["Bestätigung"].buttons["Registrierung"].tap()

        // Enter invalid data
        let nameField = app.textFields["Name"]
        nameField.tap()
        nameField.clearText()
        nameField.typeText(" ")
        app.keyboards.buttons["Return"].tap()
        app.buttons["Registrieren"].tap()
        XCTAssert(app.staticTexts["Der Name muss mindestens ein Zeichen enthalten."].exists)
    }
}

extension XCUIElement {
    func clearText() {
        guard let stringValue = self.value as? String else {
            return
        }

        // Tap to focus and select all text
        tap()

        // Replace the selected text with an empty string
        let deleteString = String(repeating: XCUIKeyboardKey.delete.rawValue, count: stringValue.count)
        typeText(deleteString)
    }
}
