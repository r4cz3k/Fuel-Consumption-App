//
//  RefuelingHistoryView.swift
//  FuelConsumption
//
//  Created by Maciej Rak on 08/11/2023.
//

import SwiftUI

struct RefuelingHistoryView: View {
    var car: CarModel
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20){
            Text("Statistics")
                .font(.largeTitle)
                .bold()
                .frame(maxWidth: .infinity)
            CarInfoRowView(infoTitle: "Tanked Fuel", infoData: "---")
            CarInfoRowView(infoTitle: "Money Paid", infoData: "---")
            
            List{
                ForEach(car.refuelingHistory){ refueling in
                    NavigationLink(
                        destination: Text("HistoryView"),
                        label: {
                            
                        })
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(PlainListStyle())
        }
        .padding()
    }
}

#Preview {
    RefuelingHistoryView(car: CarModel(id: UUID().uuidString, carBrand: "Toyota", carModel: "Yaris", fuelType: fuelTypes.gasoline.rawValue, refuelingHistory: [RefuelingHistoryItem( date: Date(), fuelAmount: 39, moneyPaid: 190), RefuelingHistoryItem( date: Date(), fuelAmount: 38, moneyPaid: 180)], registrationNumber: "XX1111A", yearOfProduction: 2016, averageConsumption: 5.4))
}
