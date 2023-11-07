//
//  CarsViewModel.swift
//  FuelConsumption
//
//  Created by Maciej Rak on 31/10/2023.
//

import Foundation

class CarsViewModel: ObservableObject{
    
    init() {
        loadCars()
    }
    
    @Published var cars: [CarModel] = [] {
        didSet{
            saveCars()
        }
    }
    
    let carsKey: String = "cars_list"
    
    func addCar(carBrand: String, carModel: String, fuelType: String, engineSize: Int){
        cars.append( CarModel(
            id: UUID().uuidString,
            carBrand: carBrand,
            carModel: carModel,
            fuelType: fuelType,
            refuelingHistory: [RefuelingHistoryItem( date: Date(), fuelAmount: 0, moneyPaid: 0)],
            engineSize: engineSize,
            averageConsumption: 0.0))
    }
    
    func deleteCar(index: IndexSet){
        cars.remove(atOffsets: index)
    }
    
    func moveCar(indices: IndexSet, newOffset: Int){
        cars.move(fromOffsets: indices, toOffset: newOffset)
    }
    
    func loadCars() {
        guard
            let data = UserDefaults.standard.data(forKey: carsKey),
            let savedCars = try? JSONDecoder().decode([CarModel].self, from: data)
        else { return }

        self.cars = savedCars
    }
    
    func saveCars() {
        if let encodedData = try? JSONEncoder().encode(cars) {
            UserDefaults.standard.set(encodedData, forKey: carsKey)
        }
    }
}
