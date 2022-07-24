//
//  PinMapComponent.swift
//  Gdansk Tour
//
//  Created by Łukasz Gołojuch on 5/27/22.
//

import SwiftUI
import MapKit

struct PinMapComponent: View {
    let appColors = AppColors()
    
    @State var jsonController = JSONController()
    @State var coordinateRegion: MKCoordinateRegion = {
            var newRegion = MKCoordinateRegion()
            newRegion.center.latitude = 54.372158
            newRegion.center.longitude = 18.638306
            newRegion.span.latitudeDelta = 0.05
            newRegion.span.longitudeDelta = 0.05
            return newRegion
        }()
    
        var annotationItems: [MyAnnotationItem] = [
            MyAnnotationItem(coordinate: CLLocationCoordinate2D(latitude: 37.810000, longitude: -122.477450)),
            MyAnnotationItem(coordinate: CLLocationCoordinate2D(latitude: 37.786996, longitude: -122.419281)),
        ]
    
    var body: some View{
        
        VStack(alignment: .leading){
            Text("Obiekty na mapie")
                .multilineTextAlignment(.leading)
                .padding()
                .fixedSize(horizontal: false, vertical: true)
                .font(.title)
                .foregroundColor(appColors.darkBlue)

            Map(coordinateRegion: $coordinateRegion,
                annotationItems: jsonController.locationData) {item in
                        MapPin(coordinate: item.locationCoordinate2D)
                }
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 300, alignment: .leading)
                            .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
                            .shadow(radius: 6)
                        
            NavigationLink {
                MapView()
            } label: {
                Text("Zobacz punkty na mapie")
            }
                .padding()
                .shadow(radius: 10)
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
                .background(appColors.buttonBackgroundColor)
                .clipShape(Capsule())
                .overlay(Capsule().stroke(appColors.overlayColor))
        }
    }
}


struct PinMapComponent_Previews: PreviewProvider {
    static var previews: some View {
        PinMapComponent()
    }
}
