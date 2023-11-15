//
//  TripModel.swift
//  FuelConsumption
//
//  Created by Maciej Rak on 14/11/2023.
//

import Foundation

struct TripModel: Identifiable, Codable {
    let id: String
    var title: String
    var participants: [ParticipantModel]
    var refuelingHistory: [RefuelingModel]
    var moneyPaid: Double
}
