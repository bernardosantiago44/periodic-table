//
//  TestGridView.swift
//  Animations
//
//  Created by Bernardo Santiago Marin on 09/07/21.
//

import SwiftUI

struct VerticalTableList: View {
    var elements: [Element]
    var columns: [GridItem] = [GridItem(.adaptive(minimum: 105), spacing: 16)]
    let defaults = UserDefaults.standard
    @EnvironmentObject var userSettings: UserSettings
    @State var sort: String
    @State var sort_mode: String
    @State var help_menu_shown: Bool
    @State var searchText: String
    var filteredElements: [Element] {
        withAnimation {
            elements.filter({ searchText.isEmpty ? true : $0.name.contains(searchText) })
        }
    }
    
    init() {
        self.elements = elementData
        self.sort = defaults.string(forKey: "default_sorting_mode") ?? "atomic_number"
        self.sort_mode = "ascending"
        self.help_menu_shown = false
        self.searchText = ""
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                SearchBar(text: $searchText)
                LazyVGrid(columns: columns) {
                    ForEach(
                        filteredElements.sorted {
                            if self.sort.elementsEqual("atomic_number") {
                                if self.sort_mode.elementsEqual("ascending") {
                                    return $0.id < $1.id
                                } else {
                                    return $0.id > $1.id
                                }
                            }
                            if self.sort.elementsEqual("name") {
                                if self.sort_mode.elementsEqual("ascending") {
                                    return $0.name < $1.name
                                } else {
                                    return $0.name > $1.name
                                }
                            }
                            if self.sort.elementsEqual("category") {
                                if self.sort_mode.elementsEqual("ascending") {
                                    return $0.category < $1.category
                                } else {
                                    return $0.category > $1.category
                                }
                            }
                            if self.sort.elementsEqual("atomic_mass") {
                                if self.sort_mode.elementsEqual("ascending") {
                                    return $0.atomic_mass < $1.atomic_mass
                                } else {
                                    return $0.atomic_mass > $1.atomic_mass
                                }
                            }
                            return $0.id < $1.id
                        }
                    ) { element in
                        NavigationLink(
                            destination: ElementDetailView(element: element),
                            label: {
                                ElementCell(element: element)
                                //                                    .animation(.spring())
                            })
                    }
                }
                .padding(.top)
            }
            .padding(.horizontal, 8)
            .navigationTitle(LocalizedStringKey("Periodic Table"))
            .sheet(isPresented: $help_menu_shown, content: {
                InformationGuide(is_shown: $help_menu_shown)
            })
            .navigationBarItems(leading: Button(action: { self.help_menu_shown = true }, label: {
                Image(systemName: "info.circle")
                    .resizable()
                    .frame(width: 25, height: 25)
            }), trailing:
                Menu(content: {
                    Group {
                        Picker(selection: $sort, label: Text("Sort")) {
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
                        }
                    }
                    Group {
                        Divider()
                        Picker(selection: $sort_mode, label: Text("Mode")) {
                            Label(
                                title: { Text(LocalizedStringKey("Ascending")) },
                                icon: { Image(systemName: "arrow.up") }
                            ).tag("ascending")
                            Label(
                                title: { Text(LocalizedStringKey("Descending")) },
                                icon: { Image(systemName: "arrow.down") }
                            ).tag("descending")
                        }
                    }
                }, label: {
                    Image(systemName: "ellipsis.circle")
                        .resizable()
                        .frame(width: 25, height: 25)
                })
            )
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct VerticalTableList_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            VerticalTableList()
                .environmentObject(UserSettings())
                .environment(\.sizeCategory, .medium)
        }
    }
}
