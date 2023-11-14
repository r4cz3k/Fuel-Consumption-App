//
//  TripRowView.swift
//  FuelConsumption
//
//  Created by Maciej Rak on 14/11/2023.
//

import SwiftUI

struct TripRowView: View {
    
    var trip: TripModel
    
    var body: some View {
            VStack(alignment: .leading, spacing: 10){
                HStack{
                    Text(trip.title)
                        .bold()
                    Spacer()
                    Text(String(format: "%.2f", trip.moneyPaid))
                        .fontWeight(.semibold)
                }
                .font(.title)
                
                CarInfoRowView(
                    infoTitle: "Participants",
                    infoData: String(trip.participants.count))
                
                CarInfoRowView(
                    infoTitle: "Cars",
                    infoData: String(trip.cars.count))
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

#Preview {
    TripRowView(trip: TripModel(id: UUID().uuidString, title: "Trip to Berlin", participants: [], cars: [], refuelingHistory: [], moneyPaid: 0.0))
}
