//
//  LocationData.swift
//  Gdansk Tour
//
//  Created by Łukasz Gołojuch on 7/24/22.
//

import UIKit
import MapKit

struct LocationData: Identifiable {
    var id = UUID()
    var name: String = ""
    var latitude: CLLocationDegrees = 54.356069
    var longitude: CLLocationDegrees = 18.659916
    
    //correlate BuildingData object with it LocationData
    var buildingObject: BuildingData = BuildingData(name: "Building name", yearOfConstruction: 2000, buildingType: "Muzeum", description: "fnjdsnafjsa", latitude: 22.22222, longitude: 33.33333, website: "wwww.google.com", imageName: "soldek")
    
    var locationCoordinate2D: CLLocationCoordinate2D {
        //return latitude and longtitude as CLLocationCoordinate2D 
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
