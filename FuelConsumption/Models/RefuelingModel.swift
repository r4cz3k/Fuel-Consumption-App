//
//  RefuelingModel.swift
//  FuelConsumption
//
//  Created by Maciej Rak on 09/11/2023.
//

import Foundation

struct RefuelingModel: Identifiable, Codable{
    var id: String = UUID().uuidString
    var date: Date
    var fuelAmount: Double
    var moneyPaid: Double
}
