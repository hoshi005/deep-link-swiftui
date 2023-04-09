//
//  deep_linksApp.swift
//  deep-links
//
//  Created by Susumu Hoshikawa on 2023/04/08.
//

import SwiftUI

@main
struct deep_linksApp: App {
    
    @StateObject private var appData: AppData = .init()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appData)
                .onOpenURL { url in
                    if let queryItems = URLComponents(url: url, resolvingAgainstBaseURL: true)?.queryItems  {
                        queryItems.forEach { queryItem in
                            // tab
                            if queryItem.name == "tab" {
                                if let value = queryItem.value, let tab = Tab.convert(from: value) {
                                    appData.activeTab = tab
                                }
                            }
                            
                            if queryItem.name == "nav" {
                                guard let value = queryItem.value?.replacingOccurrences(of: "_", with: " ") else {
                                    return
                                }
                                
                                switch appData.activeTab {
                                case .home:
                                    if let path = HomeStack.convert(from: value) {
                                        appData.homeNavStack.append(path)
                                    }
                                case .favorite:
                                    if let path = FavoriteStack.convert(from: value) {
                                        appData.favoriteNavStack.append(path.rawValue)
                                    }
                                case .settings:
                                    if let path = SettingsStack.convert(from: value) {
                                        appData.settingsNavStack.append(path)
                                    }
                                }
                            }
                        }
                    }
                }
        }
    }
}
