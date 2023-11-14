//
//  CarInfoRowView.swift
//  FuelConsumption
//
//  Created by Maciej Rak on 02/11/2023.
//

import SwiftUI

struct InfoRowView: View {
    
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
    InfoRowView(infoTitle: "Engine Size", infoData: "998 cc")
}
