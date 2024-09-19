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
        
        ZStack {
            LinearGradient(gradient: Gradient(stops: [
                .init(color: .white, location: 0.1),
                .init(color: .orange, location: 1.0)
            ]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
            .opacity(0.5)
            
            Form {
                Section(header: PageTitleView(text: "Pizza Detail")) {
                                
                                if shoppingCart.getPizzaOrderList().isEmpty {
                                    Image("emptyPizzaList")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(maxWidth: .infinity)
                                        .opacity(0.8)
                                        .cornerRadius(16)
                                    
                                }
                                List {
                                    ForEach (pizzaList , id: \.self) { item in
                                        HStack {
                                            Text(item.pizzaOrderModel.getString())
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                            
                                            Text("\(item.count)x\(item.pizzaOrderModel.price(),format: .currency(code: "EUR"))")
                                        }
                                    }
                                    .onDelete(perform: { indexSet in
                                        withAnimation {
                                            shoppingCart.removePizza(indexSet: indexSet)
                                        }
                                    })
                                }
                            }
                if !shoppingCart.getPizzaOrderList().isEmpty {
                    Button(role: .destructive, action: {
                        shoppingCart.clearCart()
                    }, label: {
                        Label("Delete All", systemImage: "trash")
                    })
                }
                
                Section (header:  Text("Total Price")) {
                    
                    Text("\(shoppingCart.totalPrice(),format: .currency(code: "EUR")) ")
                }
                
                Button {
                    path.append(AppScreen.checkOut)
                } label: {
                    Text("To Checkout")
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .font(.headline)
                        .fontWeight(.bold)
                        .cornerRadius(16)
                }
                
            }.background(Color.clear)
                .scrollContentBackground(.hidden)
                .navigationTitle("Cart")
            
                .navigationBarBackButtonHidden()
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            if path.count > 2{
                                path.removeLast(2)
                            }else {
                                path.removeLast()
                            }
                        } label: {
                            Image(systemName: "chevron.left")
                        }
                        
                    }
                }
        }
    }
}

#Preview {
    CartView(path: .constant(NavigationPath())).environmentObject(ShoppingCart())
    
}
