//
//  CarModel.swift
//  FuelConsumption
//
//  Created by Maciej Rak on 31/10/2023.
//

import Foundation

enum fuelTypes: String{
    case gasoline = "gasoline"
    case diesel = "diesel"
    case lpg = "LPG"
    case cng = "CNG"
    
    static let allFuelTypes = [gasoline, diesel, lpg, cng]
}

struct RefuelingHistoryItem: Identifiable, Codable{
    var id: String = UUID().uuidString
    var date: Date
    var fuelAmount: Double
    var moneyPaid: Double
}

struct CarModel: Identifiable, Codable{
    let id: String
    var carBrand: String
    var carModel: String
    var fuelType: String
    var refuelingHistory: [RefuelingHistoryItem]
    var registrationNumber: String
    var yearOfProduction: Int
    var averageConsumption: Double // App will have three types of average consumption - mpg, kpl, l/100km
}
