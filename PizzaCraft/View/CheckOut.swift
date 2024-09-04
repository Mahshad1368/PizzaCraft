//
//  CheckOut.swift
//  PizzaCraft
//
//  Created by Mahshad Jafari on 03.09.24.
//

import SwiftUI

struct CheckOut: View {
    var body: some View {
        
       Form {
           Section(header: Text("Payment Information")) {
               TextField("Full Name", text : .constant(""))
               TextField("Address", text: .constant(""))
               TextField("Phone Number", text:.constant(""))
           }
       Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/,
                  
                  label: {
               Text("Button")
       }).buttonStyle(.plain)
        }
    }
}

#Preview {
    CheckOut()
}
