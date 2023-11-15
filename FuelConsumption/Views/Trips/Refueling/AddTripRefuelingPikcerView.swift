//
//  AddTripRefuelingPikcerView.swift
//  FuelConsumption
//
//  Created by Maciej Rak on 15/11/2023.
//

import SwiftUI

struct AddTripRefuelingPickerView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @Binding var selection: String
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Fuel Type")
                .font(.title2)
                .fontWeight(.bold)
            Menu{
                Picker("Fuel Type", selection: $selection){
                    Text("Gasoline").tag(fuelTypes.gasoline.rawValue.capitalized)
                    Text("Diesel").tag(fuelTypes.diesel.rawValue.capitalized)
                    Text("LPG").tag(fuelTypes.lpg.rawValue)
                    Text("CNG").tag(fuelTypes.cng.rawValue)
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
    AddTripRefuelingPickerView(selection: Binding<String>.constant(""))
}
