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
    
    var body: some View {
        VStack{
            VStack(alignment: .leading){
                AddCarInputView(headline: "Car Brand", bindedText: carBrand, numKeyboard: false)
                AddCarInputView(headline: "Car Model", bindedText: carModel, numKeyboard: false)
                AddCarInputView(headline: "Engine Size", bindedText: engineSize, numKeyboard: true)
            }
        }
        .padding()
    }
}

#Preview {
    AddCarView()
}
