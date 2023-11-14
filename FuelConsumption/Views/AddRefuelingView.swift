//
//  AddRefuelingView.swift
//  FuelConsumption
//
//  Created by Maciej Rak on 13/11/2023.
//

import SwiftUI

struct AddRefuelingView: View {
    
    @State var carsViewModel: CarsViewModel
    @State var car: CarModel
    
    @State var fuelAmount: String = String()
    @State var moneyPaid: String = String()
    @State var distance: String = String()
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 20){
                AddCarInputView(headline: "Fuel Amount", bindedText: $fuelAmount, numKeyboard: true)
                
                AddCarInputView(headline: "Money Paid", bindedText: $moneyPaid, numKeyboard: true)
                
                AddCarInputView(headline: "Distance", bindedText: $distance, numKeyboard: true)
                
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
                    .onTapGesture {
                        carsViewModel.addRefueling(car: car, fuelAmount: Double(fuelAmount) ?? 0, moneyPaid: Double(moneyPaid) ?? 0, distance: Double(distance) ?? 0)
                    }
            }
            .padding()
            .navigationTitle("Add Refueling")
        }
    }
}

#Preview {
    AddRefuelingView(carsViewModel: CarsViewModel(), car: CarModel(id: UUID().uuidString, carBrand: "Toyota", carModel: "Yaris", fuelType: fuelTypes.gasoline.rawValue, refuelingHistory: [RefuelingModel( date: Date(), fuelAmount: 39, moneyPaid: 190, distance: 430.75), RefuelingModel( date: Date(), fuelAmount: 38, moneyPaid: 180, distance: 390.65)], registrationNumber: "XX1111A", yearOfProduction: 2016, averageConsumption: 5.4)  )
}
