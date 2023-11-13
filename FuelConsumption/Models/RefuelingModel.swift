//
//  RefuelingModel.swift
//  FuelConsumption
//
//  Created by Maciej Rak on 09/11/2023.
//

import Foundation

struct RefuelingModel: Identifiable, Codable{
    let id: String
    let date: Date
    let fuelAmount: Double
    let moneyPaid: Double
    
    init(id: String = UUID().uuidString, date: Date, fuelAmount: Double, moneyPaid: Double){
        self.id = id
        self.date = date
        self.fuelAmount = fuelAmount
        self.moneyPaid = moneyPaid
    }
    
    func updateRefueling(newDate: Date, newFuelAmount: Double, newMoneyPaid: Double) -> RefuelingModel {
        return RefuelingModel(id: id, date: newDate, fuelAmount: newFuelAmount, moneyPaid: newMoneyPaid)
    }
}
