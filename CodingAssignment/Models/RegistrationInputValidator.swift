//
//  RegistrationInputValidation.swift
//  CodingAssignment
//
//  Created by Prethep Paramananthan on 09.01.24.
//

import Foundation

struct RegistrationInputValidator {
    func validateName(_ input: String) -> RegistrationError? {
        guard input.hasAtLeastOneCharacter else {
            return RegistrationError.nameTooShort
        }
        return nil
    }

    func validateEmail(_ input: String) -> RegistrationError? {
        let emailRegex = #"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"#
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        guard emailPredicate.evaluate(with: input) else {
            return RegistrationError.emailInvalid
        }
        return nil
    }

    func validateDateOfBirth(_ date: Date) -> RegistrationError? {
        let lowerBound = Calendar.current.date(from: DateComponents(year: 1900, month: 1, day: 1))!
        let upperBound = Calendar.current.date(from: DateComponents(year: 2022, month: 12, day: 31, hour: 23, minute: 59, second: 59))!

        guard date >= lowerBound && date <= upperBound else {
            return RegistrationError.dateOfBirthOutOfRange
        }
        return nil
    }
}

fileprivate extension String {
    var hasAtLeastOneCharacter: Bool {
        return !self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
