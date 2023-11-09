//
//  HistoryView.swift
//  FuelConsumption
//
//  Created by Maciej Rak on 09/11/2023.
//

import SwiftUI

struct HistoryView: View {
    var refueling: RefuelingModel
    
    @State var fuelAmount: String = String()
    @State var moneyPaid: String = String()
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 20){
                AddCarInputView(headline: "Fuel Amount", bindedText: $fuelAmount, numKeyboard: true)
                
                AddCarInputView(headline: "Money Paid", bindedText: $moneyPaid, numKeyboard: true)
                
                Spacer()
                
                Text("Update")
                    .padding()
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 2)
                    )
            }
            .padding()
            .navigationTitle(String(refueling.date.formatted(.dateTime.day().month(.wide).year())))
        }
        .onAppear{
            fuelAmount = String(refueling.fuelAmount)
            moneyPaid = String(refueling.moneyPaid)
        }
    }
}

#Preview {
    HistoryView(refueling: RefuelingModel( date: Date(), fuelAmount: 39, moneyPaid: 190))
}
