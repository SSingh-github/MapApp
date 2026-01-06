//
//  LocationsView.swift
//  MapApp
//
//  Created by Sukhpreet Singh on 05/01/26.
//

import SwiftUI

struct LocationsView: View {
    @EnvironmentObject var vm : LocationsViewModel
    
    var body: some View {
        ForEach(vm.locations) { location in
            Text(location.name)
        }
    }
}

#Preview {
    LocationsView()
}
