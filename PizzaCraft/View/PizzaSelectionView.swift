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
        ZStack {
            // Background Color
//            LinearGradient(gradient: Gradient(stops: [
//                   .init(color: .white, location: 0.0),
//                   .init(color: .orange, location: 1.0)
//               ]), startPoint: .topLeading, endPoint: .bottomTrailing)
//                .ignoresSafeArea()
//                .opacity(0.5)
            Image("Gemini_Generated_Image_m2gwrym2gwrym2gw")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .frame(maxWidth: 100)
                .opacity(0.6)
        
            VStack {
                PageTitleView(text: "Select Your Pizza")

                ScrollView {
                    VStack(spacing: 16) {
                        ForEach(pizzaMenu, id: \.self) { pizza in
                            Button(action: {
                                path.append(AppScreen.pizzaDetail(pizza))
                            }, label: {
                                HStack {
                                    Image(pizza.imageName())
                                        .resizable()
                                        .scaledToFit()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(maxWidth: 100 ,maxHeight: 100)
                                        .cornerRadius(16)
                                    
                                    Text(pizza.rawValue)
                                        .foregroundColor(.orange)
                                        .fontWeight(.bold)
                                        .frame(maxWidth: .infinity)
                                        .padding()
                                    
                                    Text("+\(pizza.price(),format:.currency(code: "EUR"))")
                                        .font(.footnote)
                                        .foregroundColor(.gray)
                                        .padding()
                                }
                                .background(Color.white.opacity(0.8))
                                .cornerRadius(10)
                            })
                        }
                    }
                    .padding()
                }
            }
        }
    }
}

#Preview {
    PizzaSelectionView(path: .constant(NavigationPath()))
}
