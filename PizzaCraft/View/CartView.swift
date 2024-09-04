//
//  CartView.swift
//  PizzaCraft
//
//  Created by Mahshad Jafari on 29.08.24.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var shoppingCart: ShoppingCart
    
    var body: some View {
        
        NavigationStack {
            Form {
                
                Section(header:Text("Pizza Details")) {
                    
                    let pizzaList = shoppingCart.getPizzaList()
                    
                    List(pizzaList , id: \.self) { item in
                        Text(item)
                    }
                }
                Section (header:  Text("Total Price")) {
                    
                    Text("\(shoppingCart.totalPrice(),format: .currency(code: "EUR")) ")
                }
                Section (header: Text("Removed Option")) {
                    Text("Removed Option")
                }
        
                NavigationLink(destination: CheckOut()) { Text("To Checkout")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .font(.headline)
                        .fontWeight(.bold)
                    .cornerRadius(16) }
                
            }.navigationTitle("Cart")
            
        }
    }
}

#Preview {
    CartView().environmentObject(ShoppingCart())
}
