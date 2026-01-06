//
//  LocationsViewModel.swift
//  MapApp
//
//  Created by Sukhpreet Singh on 05/01/26.
//

import Foundation
import SwiftUI
internal import Combine

class LocationsViewModel: ObservableObject {
    
    @Published var locations: [Location] = []
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
    }
}
