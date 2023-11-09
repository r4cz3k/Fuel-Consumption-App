//
//  CarViewModel.swift
//  FuelConsumption
//
//  Created by Maciej Rak on 31/10/2023.
//

import SwiftUI

struct CarView: View {
    
    var car: CarModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            HStack{
                Text(car.carBrand)
                    .bold()
                Text(car.carModel)
                Spacer()
                Text(String(car.yearOfProduction))
                    .fontWeight(.semibold)
            }
            .font(.largeTitle)
            
            CarInfoRowView(
                infoTitle: "Registration Number",
                infoData: car.registrationNumber)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(lineWidth: 2)
        )
    }
}

#Preview {
    CarView(car: CarModel(id: UUID().uuidString, carBrand: "Toyota", carModel: "Yaris", fuelType: fuelTypes.gasoline.rawValue, refuelingHistory: [RefuelingModel( date: Date(), fuelAmount: 39, moneyPaid: 190)], registrationNumber: "XX1111A", yearOfProduction: 2016, averageConsumption: 5.4))
}
