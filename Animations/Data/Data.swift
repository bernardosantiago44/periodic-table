//
//  Data.swift
//  Animations
//
//  Created by Bernardo Santiago Marin on 10/07/21.
//

import Foundation
import UIKit
import SwiftUI

//let elementData: [Element] = load("elements_data.json")
let elementData: [Element] = load("PeriodicTableJSON.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
        fatalError("Could not find \(filename).")
        }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Could not load \(filename): \n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Could not parse \(filename) as \(T.self): \n\(error)")
    }
}
