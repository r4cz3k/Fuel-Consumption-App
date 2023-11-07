//
//  AddCarView.swift
//  FuelConsumption
//
//  Created by Maciej Rak on 06/11/2023.
//

import SwiftUI

struct AddCarView: View {
    
    @State var carBrand: String = ""
    @State var carModel: String = ""
    @State var engineSize: String = ""
    @State var fuelType: String = ""
    
    var body: some View {
        VStack{
            VStack(alignment: .leading, spacing: 20){
                AddCarInputView(headline: "Car Brand", bindedText: carBrand, numKeyboard: false)
                AddCarInputView(headline: "Car Model", bindedText: carModel, numKeyboard: false)
                AddCarInputView(headline: "Engine Size", bindedText: engineSize, numKeyboard: true)
                AddCarPickerView(selection: fuelType)
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
            }
        }
        .padding()
    }
}

#Preview {
    AddCarView()
}
