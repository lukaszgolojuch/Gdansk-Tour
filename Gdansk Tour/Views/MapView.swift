//
//  MapView.swift
//  Gdansk Tour
//
//  Created by Łukasz Gołojuch on 5/26/22.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @State var jsonController = JSONController()
    @State var coordinateRegion: MKCoordinateRegion = {
            var newRegion = MKCoordinateRegion()
            newRegion.center.latitude = 54.372158
            newRegion.center.longitude = 18.638306
            newRegion.span.latitudeDelta = 0.05
            newRegion.span.longitudeDelta = 0.05
            return newRegion
        }()
    
    var body: some View {
        Map(coordinateRegion: $coordinateRegion,
            annotationItems: jsonController.locationData) {item in
                    MapPin(coordinate: item.locationCoordinate2D)
            }
            .edgesIgnoringSafeArea(.all)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
