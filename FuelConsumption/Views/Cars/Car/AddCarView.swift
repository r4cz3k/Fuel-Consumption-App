//
//  AddCarView.swift
//  FuelConsumption
//
//  Created by Maciej Rak on 06/11/2023.
//

import SwiftUI

struct AddCarView: View {
    
    @ObservedObject var carsViewModel: CarsViewModel
    
    @State var carBrand: String = ""
    @State var carModel: String = ""
    @State var fuelType: String = ""
    @State var registrationNumber: String = ""
    @State var yearOfProduction: String = ""
    
    var body: some View {
        ScrollView(showsIndicators: false){
            VStack(alignment: .leading, spacing: 20){
                InputView(headline: "Car Brand", bindedText: $carBrand, numKeyboard: false)
                InputView(headline: "Car Model", bindedText: $carModel, numKeyboard: false)
                InputView(headline: "Registration Number", bindedText: $registrationNumber, numKeyboard: false)
                InputView(headline: "Year Of Production", bindedText: $yearOfProduction, numKeyboard: true)
                AddCarPickerView(selection: $fuelType)
                Spacer()
                Text("Add Car")
                    .padding()
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 2)
                    )
                    .onTapGesture {
                        carsViewModel.addCar(
                            carBrand: carBrand,
                            carModel: carModel,
                            fuelType: fuelType,
                            registrationNumber: registrationNumber,
                            yearOfProduction: Int(yearOfProduction) ?? 2023)
                    }
            }
        }
        .padding()
        .padding(.top, -20)
    }
}

#Preview {
    AddCarView(carsViewModel: CarsViewModel())
}
