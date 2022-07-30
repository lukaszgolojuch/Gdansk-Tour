//
//  BuildingData.swift
//  Gdansk Tour
//
//  Created by Łukasz Gołojuch on 7/24/22.
//

import UIKit
import MapKit

struct BuildingData: Decodable {
    var name: String = "" //building name
    var yearOfConstruction: Int = 2000 //building year of contruction
    var buildingType: String = "Muzeum" //building type
    var description: String = "Building description" //building descryption
    var latitude: CLLocationDegrees = 54.356069 //building latitude
    var longitude: CLLocationDegrees = 18.659916 //building longtitude
    var website: String = "https://muzeum1939.pl/" //building website URL
    var imageName: String = "image_name" //building image name
}
