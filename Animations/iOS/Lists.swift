//
//  Lists.swift
//  Animations
//
//  Created by Bernardo Santiago Marin on 11/07/21.
//

import SwiftUI

struct Lists: View {
    var body: some View {
        List {
            Section(header: Text("Header")) {
                HStack {
                    Text("A")
                    Spacer()
                    Text("Description")
                        .font(.callout)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary).opacity(0.3)
                }
                Text("B")
                Text("C")
            }
        }
        .listStyle(InsetGroupedListStyle())
    }
}

struct Lists_Previews: PreviewProvider {
    static var previews: some View {
        Lists()
            .preferredColorScheme(.dark)
    }
}
