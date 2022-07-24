//
//  BuildingData.swift
//  Gdansk Tour
//
//  Created by Łukasz Gołojuch on 7/24/22.
//

import UIKit
import WebKit
import MapKit

struct BuildingData: Decodable {
    var name: String = ""
    var yearOfConstruction: Int = 2000
    var buildingType: String = "Muzeum"
    var description: String = "Building description"
    var latitude: CLLocationDegrees = 54.356069
    var longitude: CLLocationDegrees = 18.659916
    var website: String = "https://muzeum1939.pl/"
    var imageName: String = "image_name"
}
