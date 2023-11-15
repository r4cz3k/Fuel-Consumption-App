//
//  AddCarView.swift
//  FuelConsumption
//
//  Created by Maciej Rak on 06/11/2023.
//

import SwiftUI

struct AddCarView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @ObservedObject var carsViewModel: CarsViewModel
    
    @State var carBrand: String = ""
    @State var carModel: String = ""
    @State var fuelType: String = ""
    @State var registrationNumber: String = ""
    @State var yearOfProduction: String = ""
    
    @State var showAlert: Bool = false
    @State var showSuccessAlert: Bool = false
    
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
                    .background(colorScheme == .dark ? .white : .black)
                    .foregroundStyle(colorScheme == .dark ? .black : .white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 2)
                    )
                    .onTapGesture {
                        if validateInputs(){
                            carsViewModel.addCar(
                                carBrand: carBrand,
                                carModel: carModel,
                                fuelType: fuelType,
                                registrationNumber: registrationNumber,
                                yearOfProduction: Int(yearOfProduction) ?? 2023)
                            
                            showSuccessAlert = true
                            clearInputs()
                        } else {
                            showAlert = true
                        }
                    }
            }
        }
        .alert("Inputs are empty", isPresented: $showAlert) {
            Button("OK", role: .cancel){}
        } message: {
            Text("Please make sure that all input fields are filled")
        }
        .alert("Car added", isPresented: $showSuccessAlert) {
            Button("OK", role: .cancel){}
        }
        .padding()
        .padding(.top, -20)
    }
}

extension AddCarView {
    func validateInputs() -> Bool {
        var correct: Int = 0
        
        if carBrand.replacingOccurrences(of: " ", with: "").count > 0{
            correct += 1
        }
        
        if carModel.replacingOccurrences(of: " ", with: "").count > 0{
            correct += 1
        }
        
        if fuelType.replacingOccurrences(of: " ", with: "").count > 0{
            correct += 1
        }
        
        if registrationNumber.replacingOccurrences(of: " ", with: "").count > 0{
            correct += 1
        }
        
        if yearOfProduction.replacingOccurrences(of: " ", with: "").count > 0{
            correct += 1
        }
        
        if correct == 5{
            return true
        }else{
            return false
        }
    }

    func clearInputs(){
        carBrand = ""
        carModel = ""
        fuelType = ""
        registrationNumber = ""
        yearOfProduction = ""
    }
}

#Preview {
    AddCarView(carsViewModel: CarsViewModel())
}
