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
    
    var body: some View {
        VStack{
            VStack(alignment: .leading){
                
                AddCarInputView(headline:"Car Brand",bindedText: carBrand)
            }
        }
        .padding()
    }
}

#Preview {
    AddCarView()
}
