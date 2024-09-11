//
//  PersistenceController.swift
//  PizzaCraft
//
//  Created by Mahshad Jafari on 06.09.24.
//

import Foundation
import CoreData
import SwiftUI

struct PersistenceController {
    @EnvironmentObject private var shoppingCart: ShoppingCart
    
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer
    
    init(inMemory: Bool = false) {
        
        container = NSPersistentContainer(name: "PizzaModelData")
        
        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores { persistentStoreDescription, error in
            if let error = error as? NSError {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
    }
    var viewContext: NSManagedObjectContext {
        
        return container.viewContext
    }
    func getPizzaListFromDB() ->[PizzaItem] {
        let request: NSFetchRequest<PizzaItemCoreData> = PizzaItemCoreData.fetchRequest()
        //        request.sortDescriptors = [NSSortDescriptor(keyPath: \PizzaItemCoreData.name, ascending: true)]
        do {
            let pizzaItems = try viewContext.fetch(request)
            
            print("Pizza get Items: \(pizzaItems.count)")
            
            return pizzaItems.map {pizzaItem in
                let pizzaName = pizzaItem.name ?? ""
                let pizzaCount = pizzaItem.count
                let pizzaDough = Dough(rawValue: pizzaItem.dough) ?? .Thick
                let pizzaType = Pizza(rawValue: pizzaName)
                let pizzaToppings = pizzaItem.topping ?? ""
                let pizzaOrderModel = PizzaOrderModel(dough: pizzaDough, toppings: Set(), pizzaType: pizzaType ?? .Margarita)
                let pizzaItem = PizzaItem(pizzaOrderModel: pizzaOrderModel, count: Int(pizzaCount))
                
                return pizzaItem
            }
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    func removePizzaCoredata(indexSet: IndexSet) {
        withAnimation {
            let request: NSFetchRequest<PizzaItemCoreData> = PizzaItemCoreData.fetchRequest()
            //            request.sortDescriptors = [NSSortDescriptor(keyPath: \PizzaItemCoreData.name, ascending: true)]
            
            do {
                let pizzaItems = try viewContext.fetch(request)
                
                indexSet.forEach { index in
                    let pizzaItemToDelet = pizzaItems[index]
                    viewContext.delete(pizzaItemToDelet)
                    
                }
                try viewContext.save()
                
            } catch  {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    func addPizzaCoreData(pizza: PizzaOrderModel, quantity: Int) {
        
        let newPizzaItem = PizzaItemCoreData(context: viewContext)
        
        newPizzaItem.name = pizza.pizzaType.rawValue
        newPizzaItem.count = Int64(quantity)
        newPizzaItem.dough = pizza.dough.rawValue
        newPizzaItem.topping = pizza.toppings.map { $0.rawValue }.joined(separator: " ,")
        newPizzaItem.price = pizza.price() * Double(quantity)
        
        do {
            try viewContext.save()
            
            print("Pizza Saved successfully")
        } catch  {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}
