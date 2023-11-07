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
            }
            .font(.largeTitle)
            
            CarInfoRowView(
                infoTitle: "Average Consumption",
                infoData: "\(String(car.averageConsumption))L / 100km")
            
            CarInfoRowView(
                infoTitle: "Fuel Type",
                infoData: "\(car.fuelType.capitalized)")

            CarInfoRowView(
                infoTitle: "Engine Size",
                infoData: "\(String(car.engineSize)) cc")

            VStack(alignment: .leading){
                Text("Last Refueling:")
                    .font(.title)
                    .bold()
                
                VStack(alignment: .leading, spacing: 10){
                    CarInfoRowView(
                        infoTitle: "Date",
                        infoData: String(car.refuelingHistory[car.refuelingHistory.count - 1].date.formatted(date: .numeric, time: .omitted)))
                    
                    CarInfoRowView(
                        infoTitle: "Fuel Amount",
                        infoData: "\(String(car.refuelingHistory[car.refuelingHistory.count - 1].fuelAmount)) L")
                    
                    CarInfoRowView(
                        infoTitle: "Money Amount",
                        infoData: "\(String(car.refuelingHistory[car.refuelingHistory.count - 1].moneyPaid)) PLN")
                }
                .padding(.horizontal)
            }
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
    CarView(car: CarModel(id: UUID().uuidString, carBrand: "Toyota", carModel: "Yaris", fuelType: fuelTypes.gasoline.rawValue, refuelingHistory: [RefuelingHistoryItem( date: Date(), fuelAmount: 39, moneyPaid: 190)], registrationNumber: "XX1111A", yearOfProduction: 2016, averageConsumption: 5.4))
}
