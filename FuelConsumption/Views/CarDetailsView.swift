//
//  CarDetailsView.swift
//  FuelConsumption
//
//  Created by Maciej Rak on 07/11/2023.
//

import SwiftUI

struct CarDetailsView: View {
    
    var car: CarModel
    
    var body: some View {
        NavigationStack{
            Text("CHUJ")
        }
        .toolbar{
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink(
                    destination: Text("Add Refueling"),
                    label: {
                        Text("Add")
                    }
                )
            }
        }
    }
}

#Preview {
    CarDetailsView(car: CarModel(id: UUID().uuidString, carBrand: "Toyota", carModel: "Yaris", fuelType: fuelTypes.gasoline.rawValue, refuelingHistory: [RefuelingHistoryItem( date: Date(), fuelAmount: 39, moneyPaid: 190)], registrationNumber: "XX1111A", yearOfProduction: 2016, averageConsumption: 5.4))
}
