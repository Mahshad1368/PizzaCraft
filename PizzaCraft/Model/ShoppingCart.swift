//
//  ShoppingCart.swift
//  PizzaCraft
//
//  Created by Mahshad Jafari on 03.09.24.
//

import Foundation
import SwiftUI


struct PizzaItem: Identifiable {
    
    var id: UUID = UUID()
    var pizzaOrderModel: PizzaOrderModel
    var count: Int
}

class ShoppingCart: ObservableObject {
    
    @Published var pizzaList : [PizzaItem] = []
    
    
    func addPizza( pizza: PizzaOrderModel, quantity: Int) {
        //        if var index = pizzaList.firstIndex(where: { pizzaItem in
        //            if pizzaItem.pizza.name == pizza.name {
        //                pizzaItem.count += pizza.name.count
        //            }
        //        })
        
        pizzaList.append(PizzaItem(pizzaOrderModel: pizza, count: quantity))
    }
    
    func totalPrice() -> Double {
        var result = 0.0
        for item in pizzaList {
            result += (item.pizzaOrderModel.price() * Double(item.count))
        }
        return result
        //        pizzaList.reduce(into: 0) { sum ,item in sum + (item.pizza.price * Double(item.count))}
    }
    
    func getPizzaList() -> [String]{
        var result:[String] = []
        for item in pizzaList {
            let topingString = item.pizzaOrderModel.toppings.map {$0.rawValue}.joined(separator: ", ")
            
            var string = """
                        Pizza Name: \(item.pizzaOrderModel.pizzaType.rawValue)
                        Type Dough: \(item.pizzaOrderModel.dough)
                        """
            
            // Margarita - Ham - Thick
            
            if !item.pizzaOrderModel.toppings.isEmpty {
                string +=  "\nToppings: \(topingString)"
            }
            result.append(string)
        }
        return result
    }
}
