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
                HStack{
                    Text(trip.title)
                        .bold()
                        .font(.largeTitle)
                    Spacer()
                }
                
                InfoRowView(infoTitle: "Money Paid", infoData: "\(String(format: "%.2f", trip.moneyPaid)) PLN")
                
                if (trip.participants.count > 0) {
                    InfoRowView(infoTitle: "Money per Person", infoData: String(trip.moneyPaid / Double(trip.participants.count)))
                }
                
                NavigationLink(
                    destination: Text("y"),
                    label: {
                        Text("Show Participants")
                            .padding()
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(lineWidth: 2)
                            )
                    }
                )
                
                NavigationLink(
                    destination: Text("y"),
                    label: {
                        Text("Show Refueling History")
                            .padding()
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(lineWidth: 2)
                            )
                    }
                )
                
                
                Spacer()
                
                NavigationLink(
                    destination: Text("x"),
                    label: {
                        Text("Add Refueling")
                            .padding()
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .background(colorScheme == .dark ? .white : .black)
                            .foregroundStyle(colorScheme == .dark ? .black : .white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(lineWidth: 2)
                            )
                    }
                )
            }
            .padding()
        }
    }
}

#Preview {
    TripDetailsView(tripsViewModel: TripsViewModel(), trip: TripModel(id: UUID().uuidString, title: "Trip To Berlin", participants: [], cars: [], refuelingHistory: [], moneyPaid: 0.0))
}
