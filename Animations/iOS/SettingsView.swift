//
//  SettingsView.swift
//  Periodic table
//
//  Created by Bernardo Santiago Marin on 21/07/21.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var userSettings: UserSettings
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text(LocalizedStringKey("Periodic table view"))) {
                    Toggle(isOn: $userSettings.horizontalTable, label: {
                        Text(LocalizedStringKey("Horizontal periodic table"))
                    })
                    SortingModePicker(selection: $userSettings.defaultSortingMode)
                }
                Section(header: Text(LocalizedStringKey("Element information"))) {
                    TemperatureUnitPicker(selection: $userSettings.temperature_unit)
                    ElectronConfigurationPicker(selection: $userSettings.electron_configuration)
                    Text(LocalizedStringKey("Density unit"))
                }
                //TODO: - Add an option to switch the appearance and language
                Section(header: Text(LocalizedStringKey("Information"))) {
                    Text(LocalizedStringKey("What's new"))
                    Text(LocalizedStringKey("Show onboarding"))
                    Text(LocalizedStringKey("Rate"))
                    Text(LocalizedStringKey("About"))
                    Text(LocalizedStringKey("Legal"))
                }
            }
            .navigationTitle(LocalizedStringKey("Settings"))
            .navigationBarTitleDisplayMode(.large)
        }
        .navigationViewStyle(DoubleColumnNavigationViewStyle())
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(UserSettings())
    }
}

struct SortingModePicker: View {
    @Binding var selection: String
    var body: some View {
        Picker(selection: $selection, label: Text(LocalizedStringKey("Default sorting"))) {
            Label(
                title: { Text(LocalizedStringKey("Atomic Number")) },
                icon: { Image(systemName: "textformat.123") }
            ).tag("atomic_number")
            Label(
                title: { Text(LocalizedStringKey("Element name")) },
                icon: { Image(systemName: "abc") }
            ).tag("name")
            Label(
                title: { Text(LocalizedStringKey("Category")) },
                icon: { Image(systemName: "arrow.up.arrow.down") }
            ).tag("category")
            Label(
                title: { Text(LocalizedStringKey("Atomic mass")) },
                icon: { Image(systemName: "atom") }
            ).tag("atomic_mass")
            .navigationTitle(LocalizedStringKey("Sorting mode"))
        }
    }
}

struct TemperatureUnitPicker: View {
    @Binding var selection: String
    var body: some View {
        Picker(selection: $selection, label: Text(LocalizedStringKey("Temperature unit"))) {
            Text("Celsius (ºC)").tag("celsius")
            Text("Kelvin (K)").tag("kelvin")
            Text("Fahrenheit (ºF)").tag("fahrenheit")
                .navigationTitle(LocalizedStringKey("Temperature unit"))
        }
    }
}

struct ElectronConfigurationPicker: View {
    @Binding var selection: Bool
    var body: some View {
        Picker(selection: $selection, label: Text(LocalizedStringKey("Electron configuration"))) {
            Text(LocalizedStringKey("Semantic")).tag(false)
            Text(LocalizedStringKey("Complete")).tag(true)
                .navigationTitle(LocalizedStringKey("Electron configuration"))
        }
    }
}
