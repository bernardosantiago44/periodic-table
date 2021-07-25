//
//  ElementDetailView.swift
//  Animations
//
//  Created by Bernardo Santiago Marin on 11/07/21.
//

import SwiftUI

struct ElementDetailView: View {
    
    @State var degrees: String = UserDefaults.standard.string(forKey: "temperature_unit") ?? "kelvin"
    @State private var complete_electron_configuration: Bool = UserDefaults.standard.bool(forKey: "electron_configuration")
    private var degreesSymbol: String {
        if self.degrees.elementsEqual("celsius") {
            return "C"
        }
        if self.degrees.elementsEqual("kelvin") {
            return "K"
        }
        if self.degrees.elementsEqual("fahrenheit") {
            return "F"
        }
        return "C"
    }
    var element: Element
    let screenWidth: CGFloat = UIScreen.main.bounds.width
    
    var body: some View {
            List {
                Section {
                    Text(LocalizedStringKey(self.element.name))
                        .fontWeight(.semibold)
                        .font(.largeTitle)
                    Picker(selection: self.$degrees, label: Text(LocalizedStringKey("Degrees")), content: {
                        Text(LocalizedStringKey("Celsius")).tag("celsius")
                        Text(LocalizedStringKey("Kelvin")).tag("kelvin")
                        Text(LocalizedStringKey("Fahrenheit")).tag("fahrenheit")
                    })
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.vertical, 8)
                }
                Section(header: Text(LocalizedStringKey("General properties"))) {
                    HStack {
                        Text(LocalizedStringKey("Group"))
                        Spacer()
                        Text("\(self.element.xpos)")
                            .font(.callout)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.trailing)
                            .foregroundColor(.primary).opacity(0.5)
                    }
                    HStack {
                        Text(LocalizedStringKey("Period"))
                        Spacer()
                        Text("\(element.period)")
                            .font(.callout)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.trailing)
                            .foregroundColor(.primary).opacity(0.5)
                    }
                    HStack {
                        Text(LocalizedStringKey("Category"))
                        Spacer()
                        Text(LocalizedStringKey(element.category))
                            .font(.callout)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.trailing)
                            .foregroundColor(.primary).opacity(0.5)
                    }
                    HStack {
                        Text(LocalizedStringKey("Atomic number"))
                        Spacer()
                        Text("\(element.id)")
                            .font(.callout)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.trailing)
                            .foregroundColor(.primary).opacity(0.5)
                    }
                    VStack(alignment: .leading) {
                        HStack {
                            Text(LocalizedStringKey("Electron configuration"))
                            Image(systemName: complete_electron_configuration ? "arrow.left.arrow.right" : "arrow.left.arrow.right.square")
                                .foregroundColor(.blue)
                        }
                        ScrollView(.horizontal, showsIndicators: false) {
                            if self.complete_electron_configuration {
                                HStack(spacing: 2) {
                                    ForEach(0..<element.electron_configuration.count, id:\.self) {
                                        Text("\(element.electron_configuration[$0])")
                                            .font($0 % 2 == 0 ? .system(.callout) : .system(.footnote))
                                            .baselineOffset($0 % 2 == 0 ? 0 : 12)
                                            .fontWeight(.semibold)
                                            .multilineTextAlignment(.trailing)
                                            .foregroundColor(.primary).opacity(0.5)
                                            .padding(.trailing, $0 % 2 == 0 ? 0 : 6)
                                            .frame(width: 22)
                                    }
                                }
                            } else {
                                HStack(spacing: 2) {
                                    ForEach(0..<element.electron_configuration_semantic.count, id:\.self) {
                                        Text("\(element.electron_configuration_semantic[$0])")
                                            .font($0 % 2 == 0 ? .system(.callout) : .system(.footnote))
                                            .baselineOffset($0 % 2 == 0 ? 0 : 12)
                                            .fontWeight(.semibold)
                                            .multilineTextAlignment(.trailing)
                                            .foregroundColor(.primary).opacity(0.5)
                                            .padding(.trailing, $0 % 2 == 0 ? 0 : 6)
                                    }
                                }
                            }
                        }
                    }
                    .onTapGesture {
                        withAnimation {
                            self.complete_electron_configuration.toggle()
                        }
                    }
                }
                Section(header: Text(LocalizedStringKey("Physical properties"))) {
                    HStack {
                        Text(LocalizedStringKey("Melting point"))
                        Spacer()
                        if element.has_melting_point {
                            if degrees.elementsEqual("celsius") {
                                Text("\(kelvinToCelsius(element.melting_point), specifier: "%.2f")º\(degreesSymbol)")
                                    .font(.callout)
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.trailing)
                                    .foregroundColor(.primary).opacity(0.5)
                            } else if degrees.elementsEqual("kelvin") {
                                Text("\(element.melting_point, specifier: "%.2f")º\(degreesSymbol)")
                                    .font(.callout)
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.trailing)
                                    .foregroundColor(.primary).opacity(0.5)
                            } else {
                                Text("\(kelvinToFahrenheit(element.melting_point), specifier: "%.2f")º\(degreesSymbol)")
                                    .font(.callout)
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.trailing)
                                    .foregroundColor(.primary).opacity(0.5)
                            }
                        } else {
                            Text(LocalizedStringKey("Unknown"))
                                .foregroundColor(.red)
                        }
                    }
                    HStack {
                        Text(LocalizedStringKey("Boiling point"))
                        Spacer()
                        if element.has_boiling_point {
                            if degrees.elementsEqual("celsius") {
                                Text("\(kelvinToCelsius(element.boiling_point), specifier: "%.2f")º\(degreesSymbol)")
                                    .font(.callout)
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.trailing)
                                    .foregroundColor(.primary).opacity(0.5)
                            } else if degrees.elementsEqual("kelvin") {
                                Text("\(element.boiling_point, specifier: "%.2f")º\(degreesSymbol)")
                                    .font(.callout)
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.trailing)
                                    .foregroundColor(.primary).opacity(0.5)
                            } else {
                                Text("\(kelvinToFahrenheit(element.boiling_point), specifier: "%.2f")º\(degreesSymbol)")
                                    .font(.callout)
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.trailing)
                                    .foregroundColor(.primary).opacity(0.5)
                            }
                        } else {
                            Text(LocalizedStringKey("Unknown"))
                                .foregroundColor(.red)
                        }
                    }
                    HStack {
                        Text(LocalizedStringKey("Density (g / l)"))
                        Spacer()
                        if element.density != 0 {
                            Text("\(element.density.clean)")
                                .font(.callout)
                                .fontWeight(.semibold)
                                .multilineTextAlignment(.trailing)
                                .foregroundColor(.primary).opacity(0.5)
                        } else {
                            Text(LocalizedStringKey("Unknown"))
                                .foregroundColor(.red)
                        }
                    }
                    HStack {
                        Text(LocalizedStringKey("Atomic mass"))
                        Spacer()
                        if element.atomic_mass != 0 {
                            Text("\(element.atomic_mass, specifier: "%.3f") u")
                                .font(.callout)
                                .fontWeight(.semibold)
                                .multilineTextAlignment(.trailing)
                                .foregroundColor(.primary).opacity(0.5)
                        } else {
                            Text(LocalizedStringKey("Unknown"))
                                .foregroundColor(.red)
                        }
                    }
                    HStack {
                        Text(LocalizedStringKey("State at standard temperature"))
                        Spacer()
                        Text(LocalizedStringKey(element.state_at_20_degrees))
                            .font(.callout)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.trailing)
                            .foregroundColor(.primary).opacity(0.5)
                    }
                }
                Section(header: Text(LocalizedStringKey("Other information"))) {
                    if !element.discovered_by.isEmpty {
                        HStack {
                            Text(LocalizedStringKey("Discovered by"))
                            Spacer()
                            Text(element.discovered_by)
                                .foregroundColor(.primary).opacity(0.5)
                        }
                    }
                    if !element.named_by.isEmpty {
                        HStack {
                            Text(LocalizedStringKey("Named by"))
                            Spacer()
                            Text(element.named_by)
                                .foregroundColor(.primary).opacity(0.5)
                        }
                    }
                }
                Section(header: Text(LocalizedStringKey("Summary"))) {
                    Text(element.summary)
                        .multilineTextAlignment(.leading)
                        .padding(.top, 8)
                    Link(LocalizedStringKey("Source"), destination: URL(string: element.source)!)
                    BigElementCell(element: element)
                        .frame(width: 180, height: 180)
                }
            }
            .frame(maxWidth: 720)
            .listStyle(InsetGroupedListStyle())
    }
    
    func kelvinToCelsius(_ degrees: Float) -> Float {
        return degrees - 273.15
    }
    func kelvinToFahrenheit(_ degrees: Float) -> Float {
        return (degrees - 273.15) * 9/5 + 32
    }
}


struct ElementDetailView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ElementDetailView(element: elementData[0])
                
            ElementDetailView(element: elementData[0])
                .previewDevice("iPhone 11 Pro")
        }
        
    }
}
