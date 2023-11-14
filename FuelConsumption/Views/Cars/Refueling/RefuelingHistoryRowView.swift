//
//  RefuelingHistoryRowView.swift
//  FuelConsumption
//
//  Created by Maciej Rak on 08/11/2023.
//

import SwiftUI

struct RefuelingHistoryRowView: View {
    
    let date: Date
    
    var body: some View {
        VStack{
            HStack{
                Text(String(date.formatted(.dateTime.day().month(.wide).year())))
                    .font(.headline)
                Spacer()
                Image(systemName: "fuelpump.fill")
            }
                .padding()
                .frame(maxWidth: .infinity)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 2)
                )
        }
    }
}

#Preview {
    RefuelingHistoryRowView(date: Date())
}
