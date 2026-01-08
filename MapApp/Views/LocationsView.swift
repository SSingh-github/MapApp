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
        Map(position: $vm.position)
    }
}

#Preview {
    LocationsView()
}

