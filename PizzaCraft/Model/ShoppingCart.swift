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
    var pizza: PizzaModel
    var count: Int
}

class ShoppingCart: ObservableObject {
    
    @Published var pizzaList : [PizzaItem] = []
    
    
    func addPizza( pizza: PizzaModel, quantity: Int) {
        //        if var index = pizzaList.firstIndex(where: { pizzaItem in
        //            if pizzaItem.pizza.name == pizza.name {
        //                pizzaItem.count += pizza.name.count
        //            }
        //        })
        
        pizzaList.append(PizzaItem(pizza: pizza, count: quantity))
    }
    
    func totalPrice() -> Double {
        var result = 0.0
        for item in pizzaList {
            result += (item.pizza.price * Double(item.count))
        }
        return result
        
        //        pizzaList.reduce(into: 0) { sum ,item in sum + (item.pizza.price * Double(item.count))}
        
    }
    
    func getPizzaList() -> [String]{
        var result:[String] = []
        
        for item in pizzaList {
            let topingString = item.pizza.topping
            
            
            // Margarita - Ham - Thick
            let string = """
 Pizza Name: \(item.pizza.name)
 Type Dough: \(item.pizza.dough)
 Toppings: \(item.pizza.topping)

"""
            result.append(string)
            
        }
        return result
    }
    
   
    
}
