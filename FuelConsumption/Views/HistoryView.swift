//
//  HistoryView.swift
//  FuelConsumption
//
//  Created by Maciej Rak on 09/11/2023.
//

import SwiftUI

struct HistoryView: View {
    @State var carsViewModel: CarsViewModel
    
    @State var refueling: RefuelingModel
    @State var car: CarModel
    
    @State var fuelAmount: String = String()
    @State var moneyPaid: String = String()
    @State var date: Date = Date()
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 20){
                AddCarInputView(headline: "Fuel Amount", bindedText: $fuelAmount, numKeyboard: true)
                
                AddCarInputView(headline: "Money Paid", bindedText: $moneyPaid, numKeyboard: true)
                
                DatePicker("Date", selection: $date, in: ...Date.now, displayedComponents: .date)
                
                Spacer()
                
                Text("Update")
                    .padding()
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 2)
                    )
                    .onTapGesture {
                        carsViewModel.updateRefueling(car: car, refueling: refueling, newDate: date, newFuelAmount: Double(fuelAmount) ?? 0, newMoneyPaid: Double(moneyPaid) ?? 0)
                    }
            }
            .padding()
            .navigationTitle(String(date.formatted(.dateTime.day().month(.wide).year())))
        }
        .onAppear{
            getData()
        }
    }
}

extension HistoryView {
    func getData() {
        if let index = car.refuelingHistory.firstIndex(where: { $0.id == refueling.id}){
            fuelAmount = String(car.refuelingHistory[index].fuelAmount)
            moneyPaid = String(car.refuelingHistory[index].moneyPaid)
            date = car.refuelingHistory[index].date
        }
    }
}

#Preview {
    HistoryView(carsViewModel: CarsViewModel(), refueling: RefuelingModel( date: Date(), fuelAmount: 39, moneyPaid: 190), car: CarModel(id: UUID().uuidString, carBrand: "Toyota", carModel: "Yaris", fuelType: fuelTypes.gasoline.rawValue, refuelingHistory: [RefuelingModel( date: Date(), fuelAmount: 39, moneyPaid: 190), RefuelingModel( date: Date(), fuelAmount: 38, moneyPaid: 180)], registrationNumber: "XX1111A", yearOfProduction: 2016, averageConsumption: 5.4))
}