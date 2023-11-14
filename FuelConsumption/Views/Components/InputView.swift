//
//  AddCarInputView.swift
//  FuelConsumption
//
//  Created by Maciej Rak on 07/11/2023.
//

import SwiftUI

struct InputView: View {
    
    var headline: String
    @Binding var bindedText: String
    var numKeyboard: Bool
    
    var body: some View {
        VStack(alignment: .leading){
            Text(headline)
                .font(.title2)
                .fontWeight(.bold)
            TextField("Type here...", text: $bindedText)
                .keyboardType(numKeyboard ? .decimalPad : .default)
                .padding()
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.primary,lineWidth: 2)
                )
        }
    }
}

#Preview {
    InputView(headline: "Car brand", bindedText: Binding<String>.constant(""), numKeyboard: true)
}
