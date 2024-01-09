//
//  UserProfile.swift
//  CodingAssignment
//
//  Created by Prethep Paramananthan on 09.01.24.
//

import Foundation

struct UserProfile: Codable, Hashable {
    var name: String
    var email: String
    var dateOfBirth: Date

    init(name: String = "", email: String = "", dateOfBirth: Date = .now) {
        self.name = name
        self.email = email
        self.dateOfBirth = dateOfBirth
    }
}
