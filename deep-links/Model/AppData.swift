//
//  AppData.swift
//  deep-links
//
//  Created by Susumu Hoshikawa on 2023/04/08.
//

import SwiftUI

class AppData: ObservableObject {
    @Published var activeTab: Tab = .home
    @Published var homeNavStack: [HomeStack] = []
    @Published var favoriteNavStack: [String] = []
    @Published var settingsNavStack: [SettingsStack] = []
}
