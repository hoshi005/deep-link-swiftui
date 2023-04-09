//
//  SettingsStack.swift
//  deep-links
//
//  Created by Susumu Hoshikawa on 2023/04/08.
//

import SwiftUI

enum SettingsStack: String, CaseIterable {
    case myProfile = "My Profile"
    case dataUsage = "Data Usage"
    case privacyPolicy = "Privacy Policy"
    case termsOfService = "Terms Of Service"
    
    static func convert(from: String) -> Self? {
        return self.allCases.first { tab in
            tab.rawValue.lowercased() == from.lowercased()
        }
    }
}

