//
//  CartView.swift
//  PizzaCraft
//
//  Created by Mahshad Jafari on 29.08.24.
//

import SwiftUI
import CoreData

struct CartView: View {
        
    var body: some View {
        let pizzaList = PersistenceController.shared.getPizzaListFromDB()
        let totalPrice = pizzaList.map {$0.pizzaOrderModel.price() * Double($0.count)}.reduce(0,+)
        NavigationStack {
            
            Form {
                Section(header:Text("Pizza Details")) {
                    //                    let pizzaList = shoppingCart.getPizzaOrderList()
                   
                    List {
                        
                        ForEach (pizzaList , id: \.self) { item in
                            HStack {
                                Text(item.pizzaOrderModel.getString())
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Text("\(item.count)x\(item.pizzaOrderModel.price(),format: .currency(code: "EUR"))")
                                
                            }
                            
                        }
                        .onDelete(perform: { indexSet in
                            PersistenceController.shared.removePizzaCoredata(indexSet: indexSet)
                            
                        })
                    }
                }
                Section (header:  Text("Total Price")) {
                    
                    Text("\(totalPrice,format: .currency(code: "EUR")) ")
                }
                //                Section(header: Text("getPizzaName")) {
                //
                //                    let pizzaItems = PersistenceController.shared.getPizzaListFromDB()
                //                    List {
                //                        ForEach(pizzaItems, id: \.self) { pizza in
                //                            VStack {
                //                                Text(pizza.pizzaOrderModel.dough.name())
                //                                Text(pizza.pizzaOrderModel.pizzaType)
                //                                Text(pizza.pizzaOrderModel.price())
                //                            }
                //
                //                        }.onDelete(perform: { indexSet in
                //                            PersistenceController.shared.removePizzaCoredata(indexSet: indexSet)
                //                        })
                //                    }
                //                }
                NavigationLink(destination: CheckOut()) { Text("To Checkout")
                        .padding()
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .font(.headline)
                        .fontWeight(.bold)
                        .cornerRadius(16)
                }
            }
            
        }.navigationTitle("Cart")
        
        
    }
    
}

#Preview {
    CartView().environmentObject(ShoppingCart())
    
}
