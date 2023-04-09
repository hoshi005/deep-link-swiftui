//
//  Home.swift
//  deep-links
//
//  Created by Susumu Hoshikawa on 2023/04/08.
//

import SwiftUI

struct Home: View {
    @EnvironmentObject private var appData: AppData
    var body: some View {
        TabView(selection: $appData.activeTab) {
            homeView()
                .tag(Tab.home)
                .tabItem {
                    Image(systemName: Tab.home.symbolImage)
                }
            favoriteView()
                .tag(Tab.favorite)
                .tabItem {
                    Image(systemName: Tab.favorite.symbolImage)
                }
            settingsView()
                .tag(Tab.settings)
                .tabItem {
                    Image(systemName: Tab.settings.symbolImage)
                }
        }
        .tint(.red)
    }
    
    @ViewBuilder
    func homeView() -> some View {
        NavigationStack(path: $appData.homeNavStack) {
            List {
                ForEach(HomeStack.allCases, id: \.rawValue) { link in
//                    NavigationLink(value: link) {
//                        Text(link.rawValue)
//                    }
                    NavigationLink(link.rawValue, value: link)
                }
            }
            .navigationTitle("Home")
            .navigationDestination(for: HomeStack.self) { link in
                Text(link.rawValue + " View")
            }
        }
    }
    
    @ViewBuilder
    func favoriteView() -> some View {
        NavigationStack(path: $appData.favoriteNavStack) {
            List {
                ForEach(FavoriteStack.allCases, id: \.rawValue) { link in
                    NavigationLink(value: link.rawValue) {
                        Text(link.rawValue)
                    }
                }
            }
            .navigationTitle("Favorite")
            .navigationDestination(for: String.self) { link in
                Text(link + " View")
            }
        }
    }
    
    @ViewBuilder
    func settingsView() -> some View {
        NavigationStack(path: $appData.settingsNavStack) {
            List {
                ForEach(SettingsStack.allCases, id: \.rawValue) { link in
                    NavigationLink(value: link) {
                        Text(link.rawValue)
                    }
                }
            }
            .navigationTitle("Settings")
            .navigationDestination(for: SettingsStack.self) { link in
                Text(link.rawValue + " View")
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AppData())
    }
}
