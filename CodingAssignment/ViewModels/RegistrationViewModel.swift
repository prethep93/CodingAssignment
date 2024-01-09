//
//  RegistrationViewModel.swift
//  CodingAssignment
//
//  Created by Prethep Paramananthan on 09.01.24.
//

import SwiftUI

extension RegistrationView {
    @MainActor
    final class ViewModel: ObservableObject {
        @Published var userProfile = UserProfile()
        @Published var errorMessages: [String] = [
            RegistrationError.nameTooShort.localizedMessage,
            RegistrationError.emailInvalid.localizedMessage,
            RegistrationError.dateOfBirthOutOfRange.localizedMessage
        ]

        private(set) var dateOfBirthRange: ClosedRange<Date> = {
            let lowerBound = Calendar.current.date(from: DateComponents(year: 1900, month: 1, day: 1))!
            let upperBound = Calendar.current.date(from: DateComponents(year: 2022, month: 12, day: 31, hour: 23, minute: 59, second: 59))!
            return lowerBound...upperBound
        }()

        func validateInputFields() {
            
        }

        func saveUserData() {

        }
    }
}
