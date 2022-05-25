//
//  Building.swift
//  Gdansk Tour
//
//  Created by Łukasz Gołojuch on 5/24/22.
//

import UIKit
import WebKit
import MapKit

class Building {
    
    //Types of builds 
    enum buildingTypes: String{
        case church = "kościół"
        case museum = "museum"
        case monument = "pomnik"
    }
    
    var name: String? //name of the building
    var yearOfConstruction: Int? //year of building construction
    var type: buildingTypes? //type of the building
    var description: String? //short building description
    var latitude: CLLocationDegrees? //building position (latitude)
    var longitude: CLLocationDegrees? //building position (longitude)
    var website: URL? //official building website
    
    init(Name: String, YearOfConstruction: Int, BuildingType: buildingTypes, Description: String, Latitude: CLLocationDegrees, Longitude: CLLocationDegrees, Website: URL) {
        name = Name
        yearOfConstruction = YearOfConstruction
        type = BuildingType
        description = Description
        latitude = Latitude
        longitude = Longitude
        website = Website
    }
}
