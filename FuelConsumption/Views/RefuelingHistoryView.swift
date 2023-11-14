//
//  RefuelingHistoryView.swift
//  FuelConsumption
//
//  Created by Maciej Rak on 08/11/2023.
//

import SwiftUI

struct RefuelingHistoryView: View {
    var car: CarModel
    var carsViewModel: CarsViewModel
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading, spacing: 20){
                HStack{
                    Spacer()
                }
                CarInfoRowView(infoTitle: "Tanked Fuel", infoData: "---")
                CarInfoRowView(infoTitle: "Money Paid", infoData: "---")
            }
            .navigationTitle("Statistics")
            List{
                ForEach(car.refuelingHistory){ refueling in
                    NavigationLink(
                        destination: HistoryView(carsViewModel: carsViewModel, refueling: refueling, car: car),
                        label: {
                            RefuelingHistoryRowView(date: refueling.date)
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
    RefuelingHistoryView(car: CarModel(id: UUID().uuidString, carBrand: "Toyota", carModel: "Yaris", fuelType: fuelTypes.gasoline.rawValue, refuelingHistory: [RefuelingModel( date: Date(), fuelAmount: 39, moneyPaid: 190, distance: 450.76), RefuelingModel( date: Date(), fuelAmount: 38, moneyPaid: 180, distance: 430.5)], registrationNumber: "XX1111A", yearOfProduction: 2016, averageConsumption: 5.4), carsViewModel: CarsViewModel())
}
