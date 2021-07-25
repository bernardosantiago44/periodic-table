//
//  Element.swift
//  Animations
//
//  Created by Bernardo Santiago Marin on 10/07/21.
//

import Foundation
import SwiftUI

struct PeriodicTableElement: Decodable, Identifiable {
    
    var id: Int
    var element: String
    var atomic_number: Int
    var atomic_symbol: String
    var properties: ElementProperties
    var color: String
    
    struct ElementProperties: Decodable {
        var general: ElementGeneralProperties
        var physical: ElementPhysicalProperties
    }
    
    struct ElementGeneralProperties: Decodable {
        var group: String
        var period: String
        var category: String
        var electron_configuration: [String]
    }
    
    struct ElementPhysicalProperties: Decodable {
        var has_melting_point: Bool
        var melting_point: [Float]
        var has_boiling_point: Bool
        var boiling_point: [Float]
        var has_density: Bool
        var density: Double
        var has_atomic_mass: Bool
        var atomic_mass: Float
        var state_at_20_degrees: String
    }
}

struct Element: Decodable, Identifiable {
    
    var id: Int
    var xpos: Int
    var name: String
    var atomic_mass: Float
    var has_boiling_point: Bool
    var boiling_point: Float
    var category: String
    var color: String
    var density: Float
    var discovered_by: String
    var has_melting_point: Bool
    var melting_point: Float
    var named_by: String
    var period: Int
    var state_at_20_degrees: String
    var source: String
    var summary: String
    var symbol: String
    var shells: [Int]
    var electron_configuration: [String]
    var electron_configuration_semantic: [String]
}
