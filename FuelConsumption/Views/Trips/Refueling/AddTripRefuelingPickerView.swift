//
//  AddTripRefuelingPickerView.swift
//  FuelConsumption
//
//  Created by Maciej Rak on 15/11/2023.
//

import SwiftUI

struct AddTripRefuelingPickerView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var carsViewModel: CarsViewModel
    @Binding var selection: String
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Car")
                .font(.title2)
                .fontWeight(.bold)
            Menu{
                Picker("Car", selection: $selection){
                    ForEach(carsViewModel.cars){ car in
                        Text(car.registrationNumber).tag("\(car.carBrand) \(car.carModel)")
                    }
                }
                .labelsHidden()
                .pickerStyle(InlinePickerStyle())
            } label: {
                Text(selection.count > 1 ? selection : "Select")
                    .font(.headline)
                    .foregroundStyle(colorScheme == .dark ? .white : .black)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(colorScheme == .dark ? .white : .black, lineWidth: 2)
                    )
            }
        }
    }
}

#Preview {
    AddTripRefuelingPickerView(carsViewModel: CarsViewModel(), selection: Binding<String>.constant(""))
}
