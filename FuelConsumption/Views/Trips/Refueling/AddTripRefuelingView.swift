//
//  AddTripRefuelingView.swift
//  FuelConsumption
//
//  Created by Maciej Rak on 15/11/2023.
//

import SwiftUI

struct AddTripRefuelingView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @ObservedObject var carsViewModel: CarsViewModel = CarsViewModel()
    
    @State var tripsViewModel: TripsViewModel
    @State var trip: TripModel
    
    @State var fuelAmount: String = String()
    @State var moneyPaid: String = String()
    @State var distance: String = String()
    @State var carID: String = String()
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 20){
                InputView(headline: "Fuel Amount", bindedText: $fuelAmount, numKeyboard: true)
                
                InputView(headline: "Money Paid", bindedText: $moneyPaid, numKeyboard: true)
                
                InputView(headline: "Distance", bindedText: $distance, numKeyboard: true)
                
                AddTripRefuelingPickerView(carsViewModel: carsViewModel, selection: $carID)
                
                Spacer()
                
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
                    .onTapGesture {
                        
                    }
            }
            .padding()
            .navigationTitle("Add Refueling")
        }
    }
}

#Preview {
    AddTripRefuelingView(tripsViewModel: TripsViewModel(), trip: TripModel(id: UUID().uuidString, title: "Trip To Berlin", participants: [], refuelingHistory: [], moneyPaid: 0.0))
}
