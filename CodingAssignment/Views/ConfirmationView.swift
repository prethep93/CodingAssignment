//
//  ConfirmationView.swift
//  CodingAssignment
//
//  Created by Prethep Paramananthan on 09.01.24.
//

import SwiftUI

struct ConfirmationView: View {
    @Binding var userProfile: UserProfile

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 24) {
                Text("Danke für die Registrierung")
                    .font(.title)
                    .bold()

                HStack {
                    Spacer()
                    Image(systemName: "checkmark.circle")
                        .font(.system(size: 96))
                        .foregroundColor(.green)
                        .accessibilityIdentifier("CHECKMARK_ICON")
                    Spacer()
                }

                VStack(alignment: .leading, spacing: 8) {
                    AdaptiveRow("Name", value: userProfile.name)
                    AdaptiveRow("E-Mail", value: userProfile.email)
                    AdaptiveRow("Date of birth", value: userProfile.dateOfBirth.formatted(date: .numeric, time: .omitted))
                }
                Spacer()
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .navigationTitle("Bestätigung")
    }
}

#Preview {
    ConfirmationView(userProfile: .constant(UserProfile(name: "Alice", email: "alice@mail.com", dateOfBirth: .now)))
}
