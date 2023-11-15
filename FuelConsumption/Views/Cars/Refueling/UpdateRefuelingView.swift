//
//  HistoryView.swift
//  FuelConsumption
//
//  Created by Maciej Rak on 09/11/2023.
//

import SwiftUI

struct UpdateRefuelingView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @State var carsViewModel: CarsViewModel
    @State var refueling: RefuelingModel
    @State var car: CarModel
    
    @State var fuelAmount: String = String()
    @State var moneyPaid: String = String()
    @State var distance: String = String()
    @State var date: Date = Date()
    
    @State var showAlert: Bool = false
    @State var showSuccessAlert: Bool = false
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 20){
                InputView(headline: "Fuel Amount", bindedText: $fuelAmount, numKeyboard: true)
                
                InputView(headline: "Money Paid", bindedText: $moneyPaid, numKeyboard: true)
                
                InputView(headline: "Distance", bindedText: $distance, numKeyboard: true)
                
                DatePicker("Date", selection: $date, in: ...Date.now, displayedComponents: .date)
                
                Spacer()
                
                Text("Update")
                    .padding()
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .background(colorScheme == .dark ? .white : .black)
                    .foregroundStyle(colorScheme == .dark ? .black : .white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 2)
                    )
                    .onTapGesture {
                        if validateInputs(){
                            carsViewModel.updateRefueling(car: car, refueling: refueling, newDate: date, newFuelAmount: Double(fuelAmount.replacingOccurrences(of: ",", with: ".")) ?? 0, newMoneyPaid: Double(moneyPaid.replacingOccurrences(of: ",", with: ".")) ?? 0, newDistance: Double(distance.replacingOccurrences(of: ",", with: ".")) ?? 0)
                            showSuccessAlert = true
                        } else {
                            showAlert = true
                        }
                    }
            }
            .padding()
            .navigationTitle(String(date.formatted(.dateTime.day().month(.wide).year())))
        }
        .alert("Inputs are empty", isPresented: $showAlert) {
            Button("OK", role: .cancel){}
        } message: {
            Text("Please make sure that all input fields are filled")
        }
        .alert("Refueling updated", isPresented: $showSuccessAlert) {
            Button("OK", role: .cancel){}
        }
        .onAppear{
            getData()
        }
    }
}

extension UpdateRefuelingView {
    func getData() {
        if let index = car.refuelingHistory.firstIndex(where: { $0.id == refueling.id}){
            fuelAmount = String(car.refuelingHistory[index].fuelAmount)
            moneyPaid = String(car.refuelingHistory[index].moneyPaid)
            date = car.refuelingHistory[index].date
            distance = String(car.refuelingHistory[index].distance)
        }
    }
    
    func validateInputs() -> Bool {
        var correct: Int = 0
        
        if fuelAmount.replacingOccurrences(of: " ", with: "").count > 0{
            correct += 1
        }
        
        if moneyPaid.replacingOccurrences(of: " ", with: "").count > 0{
            correct += 1
        }
        
        if distance.replacingOccurrences(of: " ", with: "").count > 0{
            correct += 1
        }
        
        if correct == 3{
            return true
        }else{
            return false
        }
    }
}

#Preview {
    UpdateRefuelingView(carsViewModel: CarsViewModel(), refueling: RefuelingModel( date: Date(), fuelAmount: 39, moneyPaid: 190, distance: 430.75), car: CarModel(id: UUID().uuidString, carBrand: "Toyota", carModel: "Yaris", fuelType: fuelTypes.gasoline.rawValue, refuelingHistory: [RefuelingModel( date: Date(), fuelAmount: 39, moneyPaid: 190, distance: 430.75), RefuelingModel( date: Date(), fuelAmount: 38, moneyPaid: 180, distance: 390.65)], registrationNumber: "XX1111A", yearOfProduction: 2016, averageConsumption: 5.4,  fuelTanked: 0.0, moneyPaid: 0.0))
}
