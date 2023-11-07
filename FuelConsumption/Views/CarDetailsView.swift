//
//  CarDetailsView.swift
//  FuelConsumption
//
//  Created by Maciej Rak on 07/11/2023.
//

import SwiftUI

struct CarDetailsView: View {
    
    var car: CarModel
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading, spacing: 20){
                HStack{
                    Text(car.carBrand)
                        .bold()
                    Text(car.carModel)
                    Spacer()
                    Text("\(String(car.averageConsumption)) L / 100 km")
                        .font(.title2)
                }
                .font(.largeTitle)
                
                CarInfoRowView(
                    infoTitle: "Registration Number",
                    infoData: car.registrationNumber)
                
                CarInfoRowView(
                    infoTitle: "Year Of Production",
                    infoData: String(car.yearOfProduction))
                
                CarInfoRowView(
                    infoTitle: "Fuel Type",
                    infoData: car.fuelType.capitalized)
                
                VStack(alignment: .leading, spacing: 20){
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
                
                Text("Show Refueling History")
                    .padding()
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 2)
                    )
                
                Spacer()
                
                Text("Add Refueling")
                    .padding()
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 2)
                    )
                
                
            }
        }
        .padding()
    }
}

#Preview {
    CarDetailsView(car: CarModel(id: UUID().uuidString, carBrand: "Toyota", carModel: "Yaris", fuelType: fuelTypes.gasoline.rawValue, refuelingHistory: [RefuelingHistoryItem( date: Date(), fuelAmount: 39, moneyPaid: 190)], registrationNumber: "XX1111A", yearOfProduction: 2016, averageConsumption: 5.4))
}
