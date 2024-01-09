//
//  CodingAssignmentApp.swift
//  CodingAssignment
//
//  Created by Prethep Paramananthan on 09.01.24.
//

import SwiftUI

@main
struct CodingAssignmentApp: App {
    @StateObject private var registrationViewModel = RegistrationView.ViewModel()

    var body: some Scene {
        WindowGroup {
            RegistrationView(viewModel: registrationViewModel)
        }
    }
}
