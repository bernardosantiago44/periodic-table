//
//  AtomModel.swift
//  Animations
//
//  Created by Bernardo Santiago Marin on 13/07/21.
//

import SwiftUI

struct AtomModel: View {
    var element: Element
    let screenWidth: CGFloat = UIScreen.main.bounds.width
    var body: some View {
        VStack {
            GeometryReader { (proxy: GeometryProxy) in
                ZStack {
                    Circle()
                        .frame(width: proxy.size.width / 6)
                }
            }
            List {
                ForEach(element.shells, id:\.self) { shell in
                    Text("\(shell)")
                }
            }
        }
    }
}

struct AtomModel_Previews: PreviewProvider {
    static var previews: some View {
        AtomModel(element: elementData[19])
    }
}
