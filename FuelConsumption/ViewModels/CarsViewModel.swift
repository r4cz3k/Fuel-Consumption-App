//
//  CarsViewModel.swift
//  FuelConsumption
//
//  Created by Maciej Rak on 31/10/2023.
//

import Foundation

class CarsViewModel: ObservableObject{
    @Published var cars: [CarModel] = [CarModel(id: UUID().uuidString, carBrand: "Toyota", carModel: "Yaris", fuelType: fuelTypes.gasoline.rawValue, refuelingHistory: [RefuelingHistoryItem( date: Date(), fuelAmount: 39, moneyPaid: 190)], engineSize: 975, averageConsumption: 5.4)]
    
    func addCar(carBrand: String, carModel: String, fuelType: String, engineSize: Int){
        cars.append( CarModel(
            id: UUID().uuidString,
            carBrand: carBrand,
            carModel: carModel,
            fuelType: fuelType,
            refuelingHistory: [],
            engineSize: engineSize,
            averageConsumption: 0.0))
    }
    
    func deleteCar(index: IndexSet){
        cars.remove(atOffsets: index)
    }
    
    func moveCar(indices: IndexSet, newOffset: Int){
        cars.move(fromOffsets: indices, toOffset: newOffset)
    }
    
}
