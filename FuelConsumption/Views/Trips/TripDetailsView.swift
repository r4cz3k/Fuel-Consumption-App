//
//  TripDetailsView.swift
//  FuelConsumption
//
//  Created by Maciej Rak on 14/11/2023.
//

import SwiftUI

struct TripDetailsView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var tripsViewModel: TripsViewModel
    var trip: TripModel
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading, spacing: 20) {
                VStack{
                    Text(trip.title)
                        .bold()
                        .font(.largeTitle)
                    
                    InfoRowView(infoTitle: "Money Paid", infoData: String(format: "%.2f", trip.moneyPaid, " PLN"))
                    
                    if (trip.participants.count > 0) {
                        InfoRowView(infoTitle: "Money per Person", infoData: String(trip.moneyPaid / Double(trip.participants.count)))
                    }
                }
            }
        }
    }
}

#Preview {
    TripDetailsView(tripsViewModel: TripsViewModel(), trip: TripModel(id: UUID().uuidString, title: "Trip To Berlin", participants: [], cars: [], refuelingHistory: [], moneyPaid: 0.0))
}
