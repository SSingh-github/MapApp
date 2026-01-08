//
//  LocationsView.swift
//  MapApp
//
//  Created by Sukhpreet Singh on 05/01/26.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    @EnvironmentObject var vm : LocationsViewModel
    
    var body: some View {
        ZStack {
            Map(position: $vm.position)
                .ignoresSafeArea()
            VStack(spacing: 0) {
                header
                    .padding()
                Spacer()
            }
        }
    }
}

#Preview {
    LocationsView()
}

extension LocationsView {
    private var header: some View {
        VStack {
            Button(action: vm.toggleLocationsList) {
                Text(vm.mapLocation.name + ", " + vm.mapLocation.cityName)
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundStyle(.primary)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .overlay(alignment: .leading) {
                        Image(systemName: "arrow.down")
                            .font(.headline)
                            .foregroundStyle(.primary)
                            .padding()
                            .rotationEffect(Angle(degrees: vm.showLocationsList ? 180 : 0))
                    }
            }
            
            if vm.showLocationsList {
                LocationsListView()
            }
        }
        .background(.thickMaterial)
        .cornerRadius(10)
        .shadow(color: Color.black, radius: 20, x: 0, y: 15)
    }
}

