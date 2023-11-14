//
//  TripsView.swift
//  FuelConsumption
//
//  Created by Maciej Rak on 14/11/2023.
//

import SwiftUI

struct TripsView: View {
    var body: some View {
        NavigationStack{
            
        }
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

#Preview {
    TripsView()
}
