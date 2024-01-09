//
//  ErrorView.swift
//  CodingAssignment
//
//  Created by Prethep Paramananthan on 09.01.24.
//

import SwiftUI

struct ErrorView: View {
    let messages: [String]

    var body: some View {
        if messages.isEmpty {
            EmptyView()
        } else {
            VStack(alignment: .leading, spacing: 8) {
                ForEach(messages, id: \.self) {
                    Label($0, systemImage: "exclamationmark.circle.fill")
                }
            }.foregroundColor(.red)
        }
    }
}
