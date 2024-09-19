//
//  CheckOut.swift
//  PizzaCraft
//
//  Created by Mahshad Jafari on 03.09.24.
//

import SwiftUI

struct CheckOut: View {
        
    var body: some View {
        
        ZStack {
            LinearGradient(gradient: Gradient(stops: [
                   .init(color: .white, location: 0.0),
                   .init(color: .orange, location: 1.0)
               ]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
                .opacity(0.5)
            
//            Image("Gemini_Generated_Image_m2gwrym2gwrym2gw")
//                .resizable()
//                .scaledToFill()
//                .ignoresSafeArea()
//                .frame(maxWidth: 100)
//                .opacity(0.6)
            
            Form {
                Section(header: PageTitleView(text: "Payment Information") )
                {
                   TextField("Full Name", text : .constant(""))
                   TextField("Address", text: .constant(""))
                   TextField("Phone Number", text:.constant(""))
               }
           Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/,
                      
                      label: {
                   Text("To Checkout")
                   .fontWeight(.heavy)
                   .font(.headline)
                   .foregroundColor(.orange)
                   .shadow(color: .gray, radius: 10)
           }).buttonStyle(.plain)
                
            }
            .background(Color.clear)
                .scrollContentBackground(.hidden)
        }
    }
}

#Preview {
    CheckOut()
}
