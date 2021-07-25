//
//  ContentView.swift
//  Animations
//
//  Created by Bernardo Santiago Marin on 09/07/21.
//

import SwiftUI

struct ContentView: View {

    @State private var selection: Tab = .table
    @ObservedObject var userSettings = UserSettings()
    
    enum Tab {
        case table
        case settings
    }
    
    var body: some View {
        
        TabView(selection: $selection) {
            if userSettings.horizontalTable {
             HorizontalTableList(elements: elementData)
                .tabItem { Label(LocalizedStringKey("Table"), systemImage: "atom") }
                .tag(Tab.table)
            } else {
            VerticalTableList()
                .environmentObject(userSettings)
                .tabItem { Label(LocalizedStringKey("Table"), systemImage: "atom") }
                .tag(Tab.table)
            }
            SettingsView()
                .environmentObject(userSettings)
                .tabItem { Label(LocalizedStringKey("Settings"), systemImage: "gear") }
                .tag(Tab.settings)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .previewDevice("iPhone 11 Pro")
        }
    }
}
