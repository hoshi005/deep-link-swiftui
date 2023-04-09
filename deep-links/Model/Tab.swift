//
//  Tab.swift
//  deep-links
//
//  Created by Susumu Hoshikawa on 2023/04/08.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case home = "Home"
    case favorite = "Favorite"
    case settings = "Settings"
    
    var symbolImage: String {
        switch self {
        case .home: return "house.fill"
        case .favorite: return "heart.fill"
        case .settings: return "gear"
        }
    }
    
    static func convert(from: String) -> Self? {
        return self.allCases.first { tab in
            tab.rawValue.lowercased() == from.lowercased()
        }
    }
}
