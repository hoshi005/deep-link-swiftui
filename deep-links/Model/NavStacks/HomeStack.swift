//
//  HomeStack.swift
//  deep-links
//
//  Created by Susumu Hoshikawa on 2023/04/08.
//

import SwiftUI

enum HomeStack: String, CaseIterable {
    case myPosts = "My Posts"
    case oldPosts = "Old Posts"
    case lastestPosts = "Lastest Posts"
    case deletedPosts = "Deleted Posts"
    
    static func convert(from: String) -> Self? {
        return self.allCases.first { tab in
            tab.rawValue.lowercased() == from.lowercased()
        }
    }
}
