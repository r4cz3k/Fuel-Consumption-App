//
//  CarsView.swift
//  FuelConsumption
//
//  Created by Maciej Rak on 31/10/2023.
//

import SwiftUI

struct CarsView: View {
    
    @ObservedObject var carsViewModel: CarsViewModel = CarsViewModel()
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(carsViewModel.cars){ car in
                    CarView(car: car)
                        .listRowSeparator(.hidden)
                }
                .onDelete(perform: { indexSet in
                    carsViewModel.cars.remove(atOffsets: indexSet)
                })
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Cars")
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .topBarTrailing){
                    NavigationLink(
                        destination: Text("Add car"),
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
    CarsView()
}
