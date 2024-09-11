//
//  PizzaDetailView.swift
//  PizzaCraft
//
//  Created by Mahshad Jafari on 03.09.24.
//

import SwiftUI


struct PizzaDetailView: View {

    @Environment(\.dismiss) var dismiss
    @Environment(\.managedObjectContext) private var viewContext

    @EnvironmentObject var shoppingCart: ShoppingCart
    @State private var goToCartView: Bool = false
    
    let pizza : Pizza
    
    @State private var selectedDough = Dough.Thick
    @State private var selectedTopping = Set<Topping>()
    @State private var pizzaQuantitySelected = 0
    
    @State var doughOptions = Dough.allCases
    @State var toppingOptions = Topping.allCases
    
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
                                Text($0.name())
                            }
                        }.pickerStyle(SegmentedPickerStyle())
                        
                    }
                    Section (header: Text("Select Topping")){
                        ForEach(toppingOptions, id: \.self) {topping in
                            Toggle(
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
                                    })) {
                                        HStack {
                                            Text(topping.rawValue)
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                            Text("+\(topping.price(),format:.currency(code: "EUR"))")
                                                .font(.footnote)
                                                .foregroundColor(.gray)
                                                
                                }
                            }
                        }
                    }
                    Section(header: Text("Quantity")) {
                        Stepper(value: $pizzaQuantitySelected, in: 0...9) {
                            Text("Number of Pizza: \(pizzaQuantitySelected + 1 ) ")
                        }
                    }
                    Section {
                        ZStack {
                            NavigationLink(destination: CartView(), isActive:  $goToCartView) {
                            }.hidden()
                            Button {
                                let pizzaMaker = PizzaOrderModel(dough: selectedDough, toppings: selectedTopping, pizzaType: pizza)
                                
                                shoppingCart.addPizza(pizza: pizzaMaker, quantity: pizzaQuantitySelected + 1)
                                
                                PersistenceController.shared.addPizzaCoreData(pizza: pizzaMaker, quantity: pizzaQuantitySelected + 1)
                                
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
