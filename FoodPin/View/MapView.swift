//
//  MapView.swift
//  FoodPin
//
//  Created by Kevin Obbayi on 12/17/25.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    var location: String = ""
    //let geoCoder = CLGeocoder()
    
    @State private var region: MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude:  40.75773, longitude: -73.985708), span: MKCoordinateSpan(latitudeDelta: 1.0, longitudeDelta: 1.0))
    
    let geocoder = CLGeocoder()
    
    
    var body: some View {
        //
        //Map(initialPosition: .region(region))
        Map(initialPosition:
              .region(MKCoordinateRegion(
                        center: CLLocationCoordinate2D(latitude: 40.75773, longitude: -73.985708),
                        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
              )))
        
    }
}

#Preview {
    MapView()
}
