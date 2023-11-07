//
//  AddCarInputView.swift
//  FuelConsumption
//
//  Created by Maciej Rak on 07/11/2023.
//

import SwiftUI

struct AddCarInputView: View {
    
    var headline: String
    
    @State var bindedText: String
    
    var body: some View {
        VStack(alignment: .leading){
            Text(headline)
                .font(.title2)
                .fontWeight(.bold)
            TextField("Type here...", text: $bindedText)
                .padding()
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(.primary,lineWidth: 2)
                )
        }
    }
}

#Preview {
    AddCarInputView(headline: "Car brand",bindedText: "")
}
