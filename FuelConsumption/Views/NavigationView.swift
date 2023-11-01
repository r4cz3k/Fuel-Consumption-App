//
//  NavigationView.swift
//  FuelConsumption
//
//  Created by Maciej Rak on 01/11/2023.
//

import SwiftUI

struct NavigationView: View {
    var body: some View {
        ZStack{
            
            TabView{
                CarsView()
                    .tabItem {
                        Image(systemName: "car")
                        Text("Cars")
                    }
                
                Text("Trips")
                    .tabItem{
                        Image(systemName: "person.3")
                        Text("Trips")
                    }
                
                Text("Settings")
                    .tabItem{
                        Image(systemName: "gear")
                        Text("Settings")
                    }
            }
        }
    }
}

#Preview {
    NavigationView()
}
