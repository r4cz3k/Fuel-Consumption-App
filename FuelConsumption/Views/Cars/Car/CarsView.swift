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
                    NavigationLink(
                        destination: CarDetailsView(carsViewModel: carsViewModel, car: car),
                        label: {
                            CarRowView(car: car)
                        }
                    )
                        .listRowSeparator(.hidden)
                }
                .onDelete(perform: carsViewModel.deleteCar)
                .onMove(perform: carsViewModel.moveCar)
            }
            .listStyle(PlainListStyle())
            .navigationTitle("My Cars")
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .topBarTrailing){
                    NavigationLink(
                        destination: AddCarView(carsViewModel: carsViewModel),
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
