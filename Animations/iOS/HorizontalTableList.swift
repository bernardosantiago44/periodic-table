//
//  HorizontalTableList.swift
//  Animations
//
//  Created by Bernardo Santiago Marin on 17/07/21.
//

import SwiftUI

struct HorizontalTableList: View {
    var elements: [Element]
    let columns: [GridItem] = [GridItem(.fixed(110), spacing: 16)]
    let rows: [GridItem] = [GridItem(.adaptive(minimum: 109), spacing: 16)]
    @State private var sort: String = "atomic_number"
    @State private var sort_mode: String = "ascending"
    @State var help_menu_shown: Bool = false
    @State var searchText: String = ""
    var body: some View {
        NavigationView {
            ScrollView([.horizontal, .vertical], showsIndicators: false) {
                VStack {
                    HStack(spacing: 2040) {
                        NavigationLink(
                            destination: ElementDetailView(element: elements[0]),
                            label: {
                                ElementCell(element: elements[0])
                            })
                        NavigationLink(
                            destination: ElementDetailView(element: elements[1]),
                            label: {
                                ElementCell(element: elements[1])
                                    .frame(width: 119, height: 119)
                            })
                    }
                    HStack(spacing: 1278) {
                        HStack {
                            ForEach(2..<4, id:\.self) { element in
                                NavigationLink(
                                    destination: ElementDetailView(element: elements[element]),
                                    label: {
                                        ElementCell(element: elements[element])
                                    })
                            }
                        }
                        HStack {
                            ForEach(4..<10, id:\.self) { element in
                                NavigationLink(
                                    destination: ElementDetailView(element: elements[element]),
                                    label: {
                                        ElementCell(element: elements[element])
                                            .frame(width: 119, height: 119)
                                    })
                            }
                        }
                    }
                    HStack(spacing: 1278) {
                        HStack {
                            ForEach(10..<12, id:\.self) { element in
                                NavigationLink(
                                    destination: ElementDetailView(element: elements[element]),
                                    label: {
                                        ElementCell(element: elements[element])
                                            .frame(width: 119, height: 119)
                                    })
                            }
                        }
                        HStack {
                            ForEach(12..<18, id:\.self) { element in
                                NavigationLink(
                                    destination: ElementDetailView(element: elements[element]),
                                    label: {
                                        ElementCell(element: elements[element])
                                            .frame(width: 119, height: 119)
                                    })
                            }
                        }
                    }
                    HStack {
                        ForEach(18..<36, id:\.self) { element in
                            NavigationLink(
                                destination: ElementDetailView(element: elements[element]),
                                label: {
                                    ElementCell(element: elements[element])
                                        .frame(width: 119, height: 119)
                                })
                        }
                    }
                    HStack {
                        ForEach(36..<54, id:\.self) { element in
                            NavigationLink(
                                destination: ElementDetailView(element: elements[element]),
                                label: {
                                    ElementCell(element: elements[element])
                                        .frame(width: 119, height: 119)
                                })
                        }
                    }
                    HStack {
                        ForEach(54..<57, id:\.self) { element in
                            NavigationLink(
                                destination: ElementDetailView(element: elements[element]),
                                label: {
                                    ElementCell(element: elements[element])
                                        .frame(width: 119, height: 119)
                                })
                        }
                        ForEach(71..<86, id:\.self) { element in
                            NavigationLink(
                                destination: ElementDetailView(element: elements[element]),
                                label: {
                                    ElementCell(element: elements[element])
                                        .frame(width: 119, height: 119)
                                })
                        }
                    }
                    HStack {
                        ForEach(86..<89, id:\.self) { element in
                            NavigationLink(
                                destination: ElementDetailView(element: elements[element]),
                                label: {
                                    ElementCell(element: elements[element])
                                        .frame(width: 119, height: 119)
                                })
                        }
                        ForEach(103..<118, id:\.self) { element in
                            NavigationLink(
                                destination: ElementDetailView(element: elements[element]),
                                label: {
                                    ElementCell(element: elements[element])
                                        .frame(width: 119, height: 119)
                                })
                        }
                    }
                }
                .padding(.vertical)
                VStack {
                    HStack {
                        ForEach(57..<71, id:\.self) { element in
                            NavigationLink(
                                destination: ElementDetailView(element: elements[element]),
                                label: {
                                    ElementCell(element: elements[element])
                                        .frame(width: 119, height: 119)
                                })
                        }
                    }
                    HStack {
                        ForEach(89..<103, id:\.self) { element in
                            NavigationLink(
                                destination: ElementDetailView(element: elements[element]),
                                label: {
                                    ElementCell(element: elements[element])
                                        .frame(width: 119, height: 119)
                                })
                        }
                    }
                }
                .padding(.top)
            }
            .navigationTitle(LocalizedStringKey("Periodic Table"))
            .sheet(isPresented: $help_menu_shown, content: {
                InformationGuide(is_shown: $help_menu_shown)
            })
            .navigationBarItems(leading: Button(action: { self.help_menu_shown = true }, label: {
                Image(systemName: "info.circle")
                    .resizable()
                    .frame(width: 25, height: 25)
            })
            )
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct HorizontalTableList_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalTableList(elements: elementData)
    }
}
