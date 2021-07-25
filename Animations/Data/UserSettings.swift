//
//  UserSettings.swift
//  Periodic table
//
//  Created by Bernardo Santiago Marin on 22/07/21.
//

import Foundation
import Combine

class UserSettings: ObservableObject {
    
    let defaults = UserDefaults.standard
    
    @Published var horizontalTable: Bool {
        didSet {
            defaults.set(horizontalTable, forKey: "horizontal_table")
        }
    }
    @Published var defaultSortingMode: String {
        didSet {
            defaults.set(defaultSortingMode, forKey: "default_sorting_mode")
        }
    }
    
    @Published var temperature_unit: String {
        didSet {
            defaults.set(temperature_unit, forKey: "temperature_unit")
        }
    }
    
    @Published var electron_configuration: Bool {
        didSet {
            defaults.set(electron_configuration, forKey: "electron_configuration")
        }
    }
    
    init() {
        self.horizontalTable = defaults.object(forKey: "horizontal_table") as? Bool ?? false
        self.defaultSortingMode = defaults.object(forKey: "default_sorting_mode") as? String ?? "atomic_number"
        self.temperature_unit = defaults.object(forKey: "temperature_unit") as? String ?? "kelvin"
        self.electron_configuration = defaults.object(forKey: "electron_configuration") as? Bool ?? false
    }
    
}
