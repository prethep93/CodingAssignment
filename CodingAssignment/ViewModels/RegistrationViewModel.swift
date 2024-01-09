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
        @Published var errorMessages: [String] = []

        private let inputValidator: RegistrationInputValidator

        init(inputValidator: RegistrationInputValidator = RegistrationInputValidator()) {
            self.inputValidator = inputValidator
        }

        func validateInputFields() {
            errorMessages.removeAll()
            errorMessages = [
                inputValidator.validateName(userProfile.name),
                inputValidator.validateEmail(userProfile.email),
                inputValidator.validateDateOfBirth(userProfile.dateOfBirth)
            ].compactMap({ $0?.localizedMessage })
        }

        func saveUserData() {

        }
    }
}
