//
//  MapAppApp.swift
//  MapApp
//
//  Created by Sukhpreet Singh on 03/01/26.
//

import SwiftUI

@main
struct MapAppApp: App {
    @StateObject var vm: LocationsViewModel = LocationsViewModel()
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(vm)
        }
    }
}
