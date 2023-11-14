//
//  CarDetailsView.swift
//  FuelConsumption
//
//  Created by Maciej Rak on 07/11/2023.
//

import SwiftUI

struct CarDetailsView: View {
    
    var carsViewModel: CarsViewModel
    var car: CarModel
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading, spacing: 20){
                HStack{
                    Text(car.carBrand)
                        .bold()
                    Text(car.carModel)
                    Spacer()
                    Text("\(String(format: "%.2f",car.averageConsumption)) L / 100 km")
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
                    
                    if(car.refuelingHistory.count > 0){
                        VStack(alignment: .leading, spacing: 10){
                            CarInfoRowView(
                                infoTitle: "Date",
                                infoData: String(car.refuelingHistory[0].date.formatted(.dateTime.day().month(.wide).year())))
                            
                            CarInfoRowView(
                                infoTitle: "Fuel Amount",
                                infoData: "\(String(car.refuelingHistory[0].fuelAmount)) L")
                            
                            CarInfoRowView(
                                infoTitle: "Money Amount",
                                infoData: "\(String(car.refuelingHistory[0].moneyPaid)) PLN")
                        }
                        .padding(.horizontal)
                    }
                }
                
                NavigationLink(
                    destination: RefuelingHistoryView(car: car, carsViewModel: carsViewModel),
                    label: {
                        Text("Show Refueling History")
                            .padding()
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(lineWidth: 2)
                            )
                    }
                )
                    
                
                Spacer()
                
                NavigationLink(
                    destination: AddRefuelingView(carsViewModel: carsViewModel, car: car),
                    label: {
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
                )
                
                
            }
        }
        .padding()
        .padding(.top, -50)
    }
}

#Preview {
    CarDetailsView(carsViewModel: CarsViewModel(),car: CarModel(id: UUID().uuidString, carBrand: "Toyota", carModel: "Yaris", fuelType: fuelTypes.gasoline.rawValue, refuelingHistory: [RefuelingModel( date: Date(), fuelAmount: 39, moneyPaid: 190, distance: 410.75)], registrationNumber: "XX1111A", yearOfProduction: 2016, averageConsumption: 5.4, fuelTanked: 0.0, moneyPaid: 0.0))
}
