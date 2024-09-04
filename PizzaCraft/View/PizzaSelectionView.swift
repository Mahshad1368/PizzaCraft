//
//  PizzaSelectionView.swift
//  PizzaCraft
//
//  Created by Mahshad Jafari on 29.08.24.
//

import SwiftUI

struct PizzaSelectionView: View {
    @State private var pizzaMenu = Pizza.allCases
    
    
    var body: some View {
        NavigationStack {
            VStack {
                
                Text("Selection Pizza")
                    .font(.headline)
                    .fontWeight(.heavy)
                
                
                List(pizzaMenu , id: \.self) { pizza in
                    NavigationLink(destination: PizzaDetailView (pizza: pizza)) {
                        
                        Text(pizza.rawValue)
                            .frame(minWidth: 0 ,maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .background(Color.red)
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .cornerRadius(10)
                        
                    }
                    
                }.navigationTitle("Select Pizza")
            }
            
        }
        
    }
}
#Preview {
    PizzaSelectionView()
}
