//
//  AdaptiveRow.swift
//  CodingAssignment
//
//  Created by Prethep Paramananthan on 09.01.24.
//

import SwiftUI

struct AdaptiveRow: View {
    @Environment(\.sizeCategory) var sizeCategory
    let title: String
    let value: String

    init(_ title: String, value: String) {
        self.title = title
        self.value = value
    }

    var body: some View {
        if sizeCategory.isAccessibilityCategory {
            VStack(alignment: .leading, spacing: 8) {
                Text(title)
                    .foregroundStyle(.primary)
                Text(value)
                    .foregroundStyle(.secondary)
            }
        } else {
            HStack {
                Text(title)
                    .foregroundStyle(.primary)
                Spacer()
                Text(value)
                    .foregroundStyle(.secondary)
            }
        }
    }
}
