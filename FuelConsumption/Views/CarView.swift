//
//  CarViewModel.swift
//  FuelConsumption
//
//  Created by Maciej Rak on 31/10/2023.
//

import SwiftUI

struct CarView: View {
    
    var car: CarModel
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text(car.carBrand)
                    .bold()
                Text(car.carModel)
                Spacer()
            }
            .font(.largeTitle)
            
             
            HStack{
                Text("Average consumption:")
                    .font(.headline)
                Text("\(String(car.averageConsumption))L / 100km")
            }
            
            HStack{
                Text("Fuel type:")
                    .font(.headline)
                Text("\(car.fuelType.capitalized)")
            }
            
            HStack{
                Text("Engine size:")
                    .font(.headline)
                Text("\(String(car.engineSize)) cc")
            }
            
            VStack(alignment: .leading){
                Text("Last Refueling:")
                    .font(.title)
                    .bold()
                VStack(alignment: .leading){
                    HStack{
                        Text("Date:")
                            .font(.headline)
                        Text(String(car.refuelingHistory[car.refuelingHistory.count - 1].date.formatted(date: .numeric, time: .omitted)))
                    }
                    HStack{
                        Text("Fuel amount:")
                            .font(.headline)
                        Text("\(String(car.refuelingHistory[car.refuelingHistory.count - 1].fuelAmount)) L")
                    }
                    HStack{
                        Text("Fuel amount:")
                            .font(.headline)
                        Text("\(String(car.refuelingHistory[car.refuelingHistory.count - 1].moneyPaid)) PLN")
                    }
                }
                .padding(.horizontal)
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(.gray)
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .padding()
    }
}

#Preview {
    CarView(car: CarModel(id: UUID().uuidString, carBrand: "Toyota", carModel: "Yaris", fuelType: fuelTypes.gasoline.rawValue, refuelingHistory: [RefuelingHistoryItem( date: Date(), fuelAmount: 39, moneyPaid: 190)], engineSize: 975, averageConsumption: 5.4))
}
