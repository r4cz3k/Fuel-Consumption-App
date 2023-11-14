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
    
    @State var tankedFuel: String = String()
    @State var moneyPaid: String = String()
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading, spacing: 20){
                HStack{
                    Spacer()
                }
                CarInfoRowView(infoTitle: "Tanked Fuel", infoData: tankedFuel)
                CarInfoRowView(infoTitle: "Money Paid", infoData: moneyPaid)
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
        .onAppear{
            tankedFuel = String(format: "%.2f",car.fuelTanked)
            moneyPaid = String(format: "%.2f",car.moneyPaid)
        }
    }
}

#Preview {
    RefuelingHistoryView(car: CarModel(id: UUID().uuidString, carBrand: "Toyota", carModel: "Yaris", fuelType: fuelTypes.gasoline.rawValue, refuelingHistory: [RefuelingModel( date: Date(), fuelAmount: 39, moneyPaid: 190, distance: 450.76), RefuelingModel( date: Date(), fuelAmount: 38, moneyPaid: 180, distance: 430.5)], registrationNumber: "XX1111A", yearOfProduction: 2016, averageConsumption: 5.4,  fuelTanked: 0.0, moneyPaid: 0.0), carsViewModel: CarsViewModel())
}
