//
//  PageTitleView.swift
//  PizzaCraft
//
//  Created by Mahshad Jafari on 17.09.24.
//

import SwiftUI

struct PageTitleView: View {
    var text : String = ""
    var body: some View {
        Text(text)
            .fontWeight(.heavy)
            .font(.title)
            .foregroundColor(.clear)
            .background(
                LinearGradient(gradient: Gradient(stops: [
                    .init(color: .black, location: 0.0),
                    .init(color: .orange, location: 1.0)
                    
                ]),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
            )
            .mask(Text(text)
                .fontWeight(.heavy)
                .font(.title))
            .padding()
    }
}

#Preview {
    PageTitleView(text: "Pizza Details")
}
