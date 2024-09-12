//
//  CartView.swift
//  PizzaCraft
//
//  Created by Mahshad Jafari on 29.08.24.
//

import SwiftUI
import CoreData

struct CartView: View {
    @EnvironmentObject private var shoppingCart: ShoppingCart
    @Binding var path: NavigationPath // Use Binding to share the path
    var body: some View {

      @State var pizzaList = shoppingCart.getPizzaOrderList()

            Form {
                Section(header:Text("Pizza Details")) {
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
                
                Button {
                    path.append(AppScreen.checkOut)
                } label: {
                    Text("To Checkout")
                            .padding()
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .font(.headline)
                            .fontWeight(.bold)
                            .cornerRadius(16)
                }

            }
            .navigationTitle("Cart")
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        path.removeLast(2)
                    } label: {
                        Image(systemName: "chevron.left")
                    }

                }
            }
    }
}

#Preview {
    CartView(path: .constant(NavigationPath())).environmentObject(ShoppingCart())
    
}
