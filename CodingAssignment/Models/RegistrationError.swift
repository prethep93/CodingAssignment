//
//  RegistrationError.swift
//  CodingAssignment
//
//  Created by Prethep Paramananthan on 09.01.24.
//

import Foundation

enum RegistrationError: Error {
    case nameTooShort
    case emailInvalid
    case dateOfBirthOutOfRange

    var localizedMessage: String {
        switch self {
        case .nameTooShort:
            "Der Name muss mindestens ein Zeichen enthalten."
        case .emailInvalid:
            "Die E-Mail-Adresse ist ungültig."
        case .dateOfBirthOutOfRange:
            "Das Geburtsdatum muss zwischen dem 1. Januar 1900 und dem 31. Dezember 2022 liegen."
        }
    }
}
