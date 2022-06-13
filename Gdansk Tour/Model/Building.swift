//
//  Building.swift
//  Gdansk Tour
//
//  Class representing each building used in this app
//  Model for creating building object
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
        case museum = "muzeum"
        case monument = "pomnik"
        case other = "inne"
    }
    
    var name: String? //name of the building
    var yearOfConstruction: Int? //year of building construction
    var type: buildingTypes? //type of the building
    var description: String? //short building description
    var latitude: CLLocationDegrees? //building position (latitude)
    var longitude: CLLocationDegrees? //building position (longitude)
    var website: URL? //official building website
    var imageName: String?? //name of the image for the background
    
    init(Name: String, YearOfConstruction: Int, BuildingType: buildingTypes, Description: String, Latitude: CLLocationDegrees, Longitude: CLLocationDegrees, Website: URL, ImageName: String) {
        name = Name
        yearOfConstruction = YearOfConstruction
        type = BuildingType
        description = Description
        latitude = Latitude
        longitude = Longitude
        website = Website
        imageName = ImageName
    }
}
