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
                    
                    let pizzaList = shoppingCart.getPizzaOrderList()
                    
                    List {

                        ForEach (pizzaList , id: \.self) { item in
                            HStack {
                                Text(item.pizzaOrderModel.getString())
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                Text("\(item.count)x\(item.pizzaOrderModel.price(),format: .currency(code: "EUR"))")
                                    
                            }

                        }
                        .onDelete(perform: { indexSet in
                            shoppingCart.removePizza(indexSet: indexSet)
  
                        })
                    }
                }
                    Section (header:  Text("Total Price")) {
                        
                        Text("\(shoppingCart.totalPrice(),format: .currency(code: "EUR")) ")
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
