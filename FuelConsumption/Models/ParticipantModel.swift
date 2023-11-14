//
//  ParticipantModel.swift
//  FuelConsumption
//
//  Created by Maciej Rak on 14/11/2023.
//

import Foundation

struct ParticipantModel: Identifiable, Codable {
    let id: String
    let name: String
    let surname: String?
    
    init(id: String = UUID().uuidString, name: String, surname: String?){
        self.id = id
        self.name = name
        self.surname = surname
    }
}
