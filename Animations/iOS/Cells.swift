//
//  Cells.swift
//  Periodic table
//
//  Created by Bernardo Santiago Marin on 21/07/21.
//

import SwiftUI

struct Cells: View {
    var body: some View {
        Image("Launchscreen_navbar")
    }
}

struct ElementCell: View {
    var element: Element
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 22)
                .foregroundColor(Color("ContainerColor"))
            VStack {
                Color(element.color)
                    .cornerRadius(8)
                    .frame(height: 4)
                    .padding(.horizontal, 12)
                HStack {
                    Text("\(element.id)")
                        .font(.system(size: 14))
                        .fontWeight(.regular)
                    Spacer()
                    Text("\(element.atomic_mass.clean)")
                        .font(.system(size: 14))
                        .fontWeight(.regular)
                }
                .padding(.horizontal, 8)
                Text(element.symbol)
                    .font(.system(size: 20))
                    .fontWeight(.medium)
                Text(LocalizedStringKey(element.name))
                    .font(.system(size: 14))
                    .fontWeight(.thin)
                    .multilineTextAlignment(.center)
                Color(element.color)
                    .cornerRadius(8)
                    .frame(height: 4)
                    .padding(.horizontal, 12)
            }
            .foregroundColor(Color("ContainerTextColor"))
            .padding(10)
        }
    }
}

struct SearchBar: View {
    @Binding var text: String
    @State private var isEditing: Bool = false
    
    var body: some View {
        HStack {
            CustomSearchBar(text: $text)
//                .padding(.horizontal, 10)
                .onTapGesture {
                    self.isEditing = true
                }
                .animation(.spring())
            if isEditing {
                Button(action: {
                    withAnimation {
                        self.isEditing = false
                        self.text = ""
                        self.hideKeyboard()
                    }
                }) {
                    Text("Cancel")
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
                .animation(.spring())
            }
        }
    }
}

struct CustomSearchBar: UIViewRepresentable {
    
    @Binding var text: String
    
    class Coordinator: NSObject, UISearchBarDelegate {
        @Binding var text: String
        
        init(text: Binding<String>) {
            _text = text
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
        }
        
        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            
            searchBar.text = ""
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $text)
    }
    
    func makeUIView(context: Context) -> some UISearchBar {
        let searchBar = UISearchBar()
        
        searchBar.returnKeyType = UIReturnKeyType.search
        searchBar.autocorrectionType = .no
        searchBar.placeholder = "Search"
        
        searchBar.delegate = context.coordinator
        
        searchBar.showsCancelButton = false
        
        return searchBar
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        uiView.text = text
    }
}

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
extension UIApplication {
    func endEditing() {
            sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
}
#endif

struct BigElementCell: View {
    let element: Element
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 22)
                .foregroundColor(Color("ContainerColor"))
            VStack(spacing: 12) {
                Color(element.color)
                    .cornerRadius(8)
                    .frame(height: 4)
                    .padding(.horizontal, 12)
                HStack {
                    Text("\(element.id)")
                        .font(.system(size: 24))
                        .fontWeight(.regular)
                    Spacer()
                    Text("\(element.atomic_mass, specifier: "%0.3f")")
                        .font(.system(size: 24))
                        .fontWeight(.regular)
                }
                .padding(.horizontal, 8)
                Text(element.symbol)
                    .font(.system(size: 30))
                    .fontWeight(.medium)
                Text(LocalizedStringKey(element.name))
                    .font(.system(size: 26))
                    .fontWeight(.thin)
                    .multilineTextAlignment(.center)
                Color(element.color)
                    .cornerRadius(8)
                    .frame(height: 4)
                    .padding(.horizontal, 12)
            }
            .foregroundColor(Color("ContainerTextColor"))
            .padding(10)
        }
    }
}

struct Cells_Previews: PreviewProvider {
    static var previews: some View {
        Cells()
    }
}
