//
//  CarsView.swift
//  FuelConsumption
//
//  Created by Maciej Rak on 31/10/2023.
//

import SwiftUI

struct CarsView: View {
    
    @ObservedObject var carsViewModel: CarsViewModel = CarsViewModel()
    
    var body: some View {
        LazyVStack{
            ScrollView(showsIndicators: false){
                ForEach(carsViewModel.cars){ car in
                    
                }
            }
        }
    }
}

#Preview {
    CarsView()
}
