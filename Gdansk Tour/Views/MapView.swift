//
//  MapView.swift
//  Gdansk Tour
//
//  Created by Łukasz Gołojuch on 5/26/22.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @State var coordinateRegion: MKCoordinateRegion = {
            var newRegion = MKCoordinateRegion()
            newRegion.center.latitude = 54.372158
            newRegion.center.longitude = 18.638306
            newRegion.span.latitudeDelta = 0.2
            newRegion.span.longitudeDelta = 0.2
            return newRegion
        }()
    
        var annotationItems: [MyAnnotationItem] = [
            MyAnnotationItem(coordinate: CLLocationCoordinate2D(latitude: 37.810000, longitude: -122.477450)),
            MyAnnotationItem(coordinate: CLLocationCoordinate2D(latitude: 37.786996, longitude: -122.419281)),
        ]
    
    var body: some View {
        NavigationView{
            Map(coordinateRegion: $coordinateRegion,
                            annotationItems: annotationItems) {item in
                            MapPin(coordinate: item.coordinate)
                        }
                            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
