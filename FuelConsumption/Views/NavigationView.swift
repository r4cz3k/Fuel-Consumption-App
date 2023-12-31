//
//  NavigationView.swift
//  FuelConsumption
//
//  Created by Maciej Rak on 01/11/2023.
//

import SwiftUI

struct NavigationView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack{
            
            TabView{
                CarsView()
                    .tabItem {
                        Image(systemName: "car")
                        Text("My Cars")
                    }
            }
            .tint(colorScheme == .dark ? .white : .black)
        }
    }
}

#Preview {
    NavigationView()
}
