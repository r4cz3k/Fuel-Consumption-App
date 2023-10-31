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
        List{
            ForEach(carsViewModel.cars){ car in
                CarView(car: car)
                    .listRowSeparator(.hidden)
            }
        }
        .listStyle(PlainListStyle())
    }
}

#Preview {
    CarsView()
}
