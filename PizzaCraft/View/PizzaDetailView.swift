//
//  PizzaDetailView.swift
//  PizzaCraft
//
//  Created by Mahshad Jafari on 03.09.24.
//

import SwiftUI


struct PizzaDetailView: View {
    
    
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var shoppingCart: ShoppingCart
    
    @State private var goToCartView: Bool = false
    
    let pizza : Pizza
    
    @State private var selectedDough = Dough.Thick
    @State private var selectedTopping = Set<String>()
    @State private var pizzaQuantitySelected = 0
    
    @State var doughOptions = Dough.allCases
    @State var toppingOptions = ["Ham", "Salami", "Mushrooms", "Bell Peppers"]
    
    var body: some View {
        NavigationStack {
            VStack {
                Text(pizza.rawValue)
                    .font(.title)
                    .padding()
                
                Form {
                    Section(header: Text("Select Dough")) {
                        Picker("Dough Type",selection : $selectedDough) {
                            ForEach (doughOptions , id: \.self) {
                                Text($0.rawValue)
                            }
                        }.pickerStyle(SegmentedPickerStyle())
                        
                    }
                    Section (header: Text("Select Topping")){
                        ForEach(toppingOptions, id: \.self) {topping in
                            Toggle( topping,
                                    isOn: Binding(
                                        get: {
                                            selectedTopping.contains(topping)
                                        },
                                        set: { isSelected in
                                            if isSelected {
                                                selectedTopping.insert(topping)
                                                
                                            }else {
                                                selectedTopping.remove(topping)
                                            }
                                        }))
                        }
                    }
                    
                    Section(header: Text("Quantity")) {
                        Stepper(value: $pizzaQuantitySelected, in: 0...9) {
                            Text("Number of Pizza :\(pizzaQuantitySelected + 1 ) ")
                        }
                    }
                    Section {
                        ZStack {
                            NavigationLink(destination: CartView(), isActive: $goToCartView) {
                            }.hidden()
                            Button {
                                let pizzaMaker = PizzaOrderModel(dough: selectedDough, topping: selectedTopping, pizzaType: pizza)
                                
                                shoppingCart.addPizza(pizza: pizzaMaker, quantity: pizzaQuantitySelected + 1)
                                
                                self.goToCartView = true
                                
                                print("It works")
                                
                            } label: {
                                Text("Add to Cart")
                                    .padding()
                                    .font(.headline)
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(16)
                                
                            }.buttonStyle(.plain)
                            
                        }.frame(minWidth: 0, maxWidth: .infinity)
                    }
                }
            }
        }
    }
}
#Preview {
    PizzaDetailView(pizza: .Margarita)
        .environmentObject(ShoppingCart())
}
