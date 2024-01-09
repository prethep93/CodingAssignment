//
//  RegistrationView.swift
//  CodingAssignment
//
//  Created by Prethep Paramananthan on 09.01.24.
//

import SwiftUI

struct RegistrationView: View {
    @ObservedObject private var viewModel: RegistrationView.ViewModel
    @State private var canShowConfirmation = false

    init(viewModel: RegistrationView.ViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationStack {
            Form {
                Section("Kontakt Informationen") {
                    TextField("Name", text: $viewModel.userProfile.name)
                    TextField("E-Mail", text: $viewModel.userProfile.email)
                }
                Section("Geburtsdatum") {
                    DatePicker("Geburtsdatum", selection: $viewModel.userProfile.dateOfBirth, in: ...Date(), displayedComponents: .date)
                        .datePickerStyle(.graphical)
                }
                Section {
                    ErrorView(messages: viewModel.errorMessages)
                }
                Section {
                    Button("Registrieren") {
                        if viewModel.validateInputFields() {
                            viewModel.saveUserProfile()
                            canShowConfirmation = true
                        }
                    }
                }
            }
            .navigationTitle("Registrierung")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(isPresented: $canShowConfirmation) {
                ConfirmationView(userProfile: $viewModel.userProfile)
            }
        }
    }
}

#Preview {
    RegistrationView(viewModel: RegistrationView.ViewModel())
}
