//
//  CarsViewModel.swift
//  FuelConsumption
//
//  Created by Maciej Rak on 31/10/2023.
//

import Foundation

class CarsViewModel: ObservableObject{
    @Published var cars: [CarModel] = [CarModel(id: UUID().uuidString, carBrand: "Toyota", carModel: "Yaris", fuelType: fuelTypes.gasoline.rawValue, refuelingHistory: [RefuelingHistoryItem( date: Date(), fuelAmount: 39, moneyPaid: 190)], engineSize: 975, averageConsumption: 5.4)]
}
