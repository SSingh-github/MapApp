//
//  LocationsViewModel.swift
//  MapApp
//
//  Created by Sukhpreet Singh on 05/01/26.
//

import Foundation
import SwiftUI
internal import Combine
import MapKit

class LocationsViewModel: ObservableObject {
    
    @Published var locations: [Location] = []
    @Published var position: MapCameraPosition = .region(
        MKCoordinateRegion()
    )
    @Published var mapLocation: Location {
        didSet {
            updateMapLocation(location: mapLocation)
        }
    }
    let mapSpan =  MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        updateMapLocation(location: mapLocation)
    }
    
    private func updateMapLocation(location: Location) {
        withAnimation(.easeInOut) {
            position = .region(MKCoordinateRegion(center: location.coordinates, span: mapSpan))
        }
    }
}
