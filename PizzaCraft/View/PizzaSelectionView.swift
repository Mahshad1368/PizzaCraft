//
//  PizzaSelectionView.swift
//  PizzaCraft
//
//  Created by Mahshad Jafari on 29.08.24.
//

import SwiftUI

struct PizzaSelectionView: View {
   
    @Environment(\.managedObjectContext) private var viewContext
    @State private var pizzaMenu = Pizza.allCases
    @Binding var path: NavigationPath // Use Binding to share the path

    var body: some View {
            VStack {
                Text("Selection Pizza")
                    .font(.headline)
                    .fontWeight(.heavy)
                
                
                List(pizzaMenu , id: \.self) { pizza in
                    
                    Button(action: {
                        path.append(AppScreen.pizzaDetail(pizza))
                    }, label: {
                        Text(pizza.rawValue)
                            .frame(minWidth: 0 ,maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .background(Color.red)
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .cornerRadius(10)
                    })
 
                }.navigationTitle("Select Pizza")
            }
        }
  
    }
#Preview {
    PizzaSelectionView(path: .constant(NavigationPath()))
}
