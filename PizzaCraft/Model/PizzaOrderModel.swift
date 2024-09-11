//
//  PizzaModel.swift
//  PizzaCraft
//
//  Created by Mahshad Jafari on 03.09.24.
//

import Foundation

struct PizzaOrderModel {
    
        var dough : Dough
        var toppings :Set<Topping>
        var pizzaType : Pizza
    
    func getString() -> String {
        let toppingString = toppings.map {$0.rawValue}.joined(separator: ", ")

        var title =    """
                        Pizza Name: \(pizzaType.rawValue)
                        Type Dough: \(dough.name())
                        """
        // Margarita - Ham - Thick
        if !toppings.isEmpty {
            title +=  "\nToppings: \(toppingString)"
        }
        return title
    }
    
    func price() -> Double {
        let totalPrice = pizzaType.price()
        + dough.price()
        + toppings.map {
            $0.price()
        }.reduce(0, +)
        
        //SUM WITH FOR IN
        
//        for item in toppings {
//            totalPrice += item.price()
//        }
//        return totalPrice
//        
       
        
        //SUM WITH REDUCE()
//        toppings.reduce(0) { sum , item in
//            sum + item.price()
//        }
        return totalPrice
    }
    
//    func getOrderTitle() -> String {
//        var result = ""
//        for item in pizz {
//            let toppingString = item.pizzaOrderModel.toppings.map {$0.rawValue}.joined(separator: ", ")
//            
//            var string = """
//                        Pizza Name: \(item.pizzaOrderModel.pizzaType.rawValue)
//                        Type Dough: \(item.pizzaOrderModel.dough)
//                        """
//            
//            // Margarita - Ham - Thick
//            
//            if !item.pizzaOrderModel.toppings.isEmpty {
//                string +=  "\nToppings: \(toppingString)"
//            }
//            result.append(string)
//        }
//        return result
//    }
}

enum Pizza: String, CaseIterable {
    case Margarita = "Margarita Pizza"
    case Pepperoni = "Pepperoni Pizza"
    case Salami = "Salami Pizza"
    
    
    func price() -> Double {
        switch self {
        case .Margarita : 7.0
        case .Pepperoni : 6.0
        case .Salami : 5.0
        }
    }
}
@objc
public enum Dough: Int16, CaseIterable {
    case Thick
    case Thin
    
    func price() -> Double {
        switch self {
            
        case .Thick: 2.0
        case .Thin: 3.0
        }
    }
    func name() -> String {
        switch self{
        case .Thin:"Thin"
        case .Thick:"Thick"
        }
    }
}

enum Topping: String, CaseIterable {
    
    case Ham = "Ham"
    case Salami = "Salami"
    case Mushrooms = "Mushrooms"
    case BellPeppers = "Bell Peppers"
    

    func price() -> Double {
        
        switch self {
        case .Ham : 1.50
        case .BellPeppers: 2.0
        case .Mushrooms: 1.2
        case .Salami: 2.30
            
        }
    }
}

//@State var toppingOptions = ["Ham", "Salami", "Mushrooms", "Bell Peppers"]
