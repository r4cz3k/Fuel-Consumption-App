//
//  CarInfoRowView.swift
//  FuelConsumption
//
//  Created by Maciej Rak on 02/11/2023.
//

import SwiftUI

struct CarInfoRowView: View {
    
    let infoTitle: String
    let infoData: String
    
    var body: some View {
        HStack{
            Text("\(infoTitle):")
                .font(.headline)
            Text(infoData)
        }
    }
}

#Preview {
    CarInfoRowView(infoTitle: "Engine Size", infoData: "998 cc")
}
