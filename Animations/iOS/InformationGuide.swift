//
//  InformationGuide.swift
//  Animations
//
//  Created by Bernardo Santiago Marin on 13/07/21.
//

import SwiftUI

struct InformationGuide: View {
    @Binding var is_shown: Bool
    let screenWidth: CGFloat = UIScreen.main.bounds.width
    let category_colors: [String] = ["actinide", "alkali_metal", "alkaline_earth_metal", "halogen", "lanthanide", "metalloid", "noble_gas", "non_metal", "post_transition_metal", "transition_metal" ,"unknown"]
    var body: some View {
        NavigationView {
            List {
                HStack {
                    Image("ElementInformationImage")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                Section(header: Text(LocalizedStringKey("Category and color"))) {
                    ForEach(0..<category_colors.count, id:\.self) { category in
                        HStack {
                            RoundedRectangle(cornerRadius: 12)
                                .frame(width: 40, height: 40)
                                .foregroundColor(Color(category_colors[category]))
                            Text(LocalizedStringKey(category_colors[category]))
                        }
                    }
                }
                Section(header: Text(LocalizedStringKey("Electron configuration"))) {
                    Text(LocalizedStringKey("Electron_description_1"))
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 2) {
                            ForEach(0..<elementData[81].electron_configuration_semantic.count, id:\.self) {
                                Text("\(elementData[81].electron_configuration_semantic[$0])")
                                    .font($0 % 2 == 0 ? .system(.callout) : .system(.footnote))
                                    .baselineOffset($0 % 2 == 0 ? 0 : 10)
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.trailing)
                                    .foregroundColor(.primary).opacity(0.5)
                                    .padding(.trailing, $0 % 2 == 0 ? 0 : 6)
                            }
                        }
                    }
                    Text(LocalizedStringKey("Electron_description_2"))
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 2) {
                            ForEach(0..<elementData[81].electron_configuration.count, id:\.self) {
                                Text("\(elementData[81].electron_configuration[$0])")
                                    .font($0 % 2 == 0 ? .system(.callout) : .system(.footnote))
                                    .baselineOffset($0 % 2 == 0 ? 0 : 12)
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.trailing)
                                    .foregroundColor(.primary).opacity(0.5)
                                    .padding(.trailing, $0 % 2 == 0 ? 0 : 6)
                                    .frame(width: 22)
                            }
                        }
                    }
                }
            }
            .navigationTitle(LocalizedStringKey("Information"))
            .toolbar(content: {
                Button(action: { self.is_shown = false }, label: {
                    Text(LocalizedStringKey("Done"))
                        .bold()
                })
            })
            
        }
    }
}

struct InformationGuide_Previews: PreviewProvider {
    static var previews: some View {
        InformationGuide(is_shown: .constant(true))
            .preferredColorScheme(.dark)
    }
}
