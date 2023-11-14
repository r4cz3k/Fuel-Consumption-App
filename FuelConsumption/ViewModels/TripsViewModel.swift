//
//  TripsViewModel.swift
//  FuelConsumption
//
//  Created by Maciej Rak on 14/11/2023.
//

import Foundation

class TripsViewModel: ObservableObject {
    
    init() {
        loadTrips()
    }
    
    @Published var trips: [TripModel] = []{
        didSet{
            saveTrips()
        }
    }
    
    let tripsKey = "trips_list"
    
    func addTrip(title: String) {
        trips.append(TripModel(
            id: UUID().uuidString,
            title: title,
            participants: [],
            cars: [],
            refuelingHistory: [],
            moneyPaid: 0.0))
    }
    
    func deleteTrip(index: IndexSet) {
        trips.remove(atOffsets: index)
    }
    
    func moveTrip(indices: IndexSet, newOffset: Int) {
        trips.move(fromOffsets: indices, toOffset: newOffset)
    }
    
    func loadTrips() {
        guard
            let data = UserDefaults.standard.data(forKey: tripsKey),
            let savedTrips = try? JSONDecoder().decode([TripModel].self, from: data)
        else { return }

        self.trips = savedTrips
    }
    
    func saveTrips() {
        if let encodedData = try? JSONEncoder().encode(trips) {
            UserDefaults.standard.set(encodedData, forKey: tripsKey)
        }
    }
}
