//
//  TripsView.swift
//  FuelConsumption
//
//  Created by Maciej Rak on 14/11/2023.
//

import SwiftUI

struct TripsView: View {
    
    @ObservedObject var tripsViewModel: TripsViewModel = TripsViewModel()
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(tripsViewModel.trips){ trip in
                    NavigationLink(
                        destination: TripDetailsView(tripsViewModel: tripsViewModel, trip: trip),
                        label: {
                            TripRowView(trip: trip)
                        }
                    )
                        .listRowSeparator(.hidden)
                }
                .onDelete(perform: tripsViewModel.deleteTrip)
                .onMove(perform: tripsViewModel.moveTrip)
            }
            .navigationTitle("Trips")
            .listStyle(PlainListStyle())
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .topBarTrailing){
                    NavigationLink(
                        destination: Text("ADD TRIP"),
                        label: {
                            Text("Add")
                        }
                    )
                }
            }
        }
    }
}

#Preview {
    TripsView()
}
