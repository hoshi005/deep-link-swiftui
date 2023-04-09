//
//  FavoriteStack.swift
//  deep-links
//
//  Created by Susumu Hoshikawa on 2023/04/08.
//

import SwiftUI

enum FavoriteStack: String, CaseIterable {
    case chisato = "chisato"
    case takina = "takina"
    
    static func convert(from: String) -> Self? {
        return self.allCases.first { tab in
            tab.rawValue.lowercased() == from.lowercased()
        }
    }
}

