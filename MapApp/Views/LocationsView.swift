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
            Map(position: $vm.position, content: {
                ForEach(vm.locations) { location in
                    Annotation(location.name, coordinate: location.coordinates) {
                        VStack(spacing: 4) {
                            Image(systemName: "mappin.circle.fill")
                                .font(.title)
                                .foregroundStyle(.red)
                            Text(location.name)
                                .font(.caption)
                                .fixedSize()
                        }
                    }
                }
            })
            .ignoresSafeArea()

           
            VStack(spacing: 0) {
                header
                    .padding()
                Spacer()
                locationsPreviewStack
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
    
    private var locationsPreviewStack: some View {
            ZStack {
                ForEach(vm.locations) { location in
                    if vm.mapLocation == location {
                        LocationPreviewView(location: location)
                            .shadow(color: Color.black.opacity(0.3), radius: 20)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .transition(.asymmetric(
                                insertion: .move(edge: .trailing),
                                removal: .move(edge: .leading)))
                    }
                }
            }
        }
}

