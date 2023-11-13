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
    
    func addCar(carBrand: String, carModel: String, fuelType: String, registrationNumber: String, yearOfProduction: Int){
        cars.append( CarModel(
            id: UUID().uuidString,
            carBrand: carBrand,
            carModel: carModel,
            fuelType: fuelType,
            refuelingHistory: [RefuelingModel( date: Date(), fuelAmount: 0, moneyPaid: 0)],
            registrationNumber: registrationNumber,
            yearOfProduction: yearOfProduction,
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

    func updateRefueling(car: CarModel, refueling: RefuelingModel, newDate: Date, newFuelAmount: Double, newMoneyPaid: Double){
        if let carIndex = cars.firstIndex(where: {$0.id == car.id}){
            if let refuelingIndex = car.refuelingHistory.firstIndex(where: {$0.id == refueling.id}){
                cars[carIndex].refuelingHistory[refuelingIndex] = refueling.updateRefueling(newDate: newDate, newFuelAmount: newFuelAmount, newMoneyPaid: newMoneyPaid)
            }
        }
    }
    
    func addRefueling(car: CarModel, fuelAmount: Double, moneyPaid: Double){
        if let index = cars.firstIndex(where: {$0.id == car.id}){
            cars[index].refuelingHistory.insert(RefuelingModel(date: Date(), fuelAmount: fuelAmount, moneyPaid: moneyPaid), at: 0)
        }
    }
}
