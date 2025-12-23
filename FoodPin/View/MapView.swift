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
    
  //  @State private var region: MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.75773, longitude: -73.985708), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    
    @State private var position: MapCameraPosition = .automatic
    @State private var markerLocation = CLLocation()
    
    var body: some View {
        
        Map(position: $position) {
            Marker("Here", coordinate: markerLocation.coordinate)
                .tint(.red)
        }
        .task {
            convertAddress(location: location)
        }
         
        //Map(initialPosition: .region(region))
    }
    
    
    private func convertAddress(location: String) {
        
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(location, completionHandler: { placemarks, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let placemarks = placemarks,
               let location = placemarks[0].location else {
                return
            }
            
            let region = MKCoordinateRegion(center: location.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.0015, longitudeDelta: 0.0015))
            
            self.position = .region(region)
            self.markerLocation = location
        })
    }
}

#Preview {
   
    MapView(location: "1308 5th Avenue, Seattle, WA 98101, USA")
}
