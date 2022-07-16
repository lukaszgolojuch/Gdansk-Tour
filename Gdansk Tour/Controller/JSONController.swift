//
//  JSONController.swift
//  Gdansk Tour
//
//  Created by Łukasz Gołojuch on 7/16/22.
//

import Foundation

public class JSONController {
    
    @Published var buildingData = [BuildingData]()
    
    init() {
        //load data when JSONController class object is created
        loadData()
    }
    
    func loadData() {
        
        if let fileLocation = Bundle.main.url(forResource: "buildingInfo", withExtension: "json") {
            do {
                let data = try Data(contentsOf: fileLocation)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode([BuildingData].self, from: data)
                
                //save JSON data into buildingData array
                self.buildingData = dataFromJson
            }
            catch{
                print(error)
            }
        }
    }
    
    func getBuildingData(searchedName: String) -> BuildingData {
        
        for building in buildingData {
            if(building.name == searchedName){
                return(BuildingData(name: building.name, yearOfConstruction: building.yearOfConstruction, buildingType: building.buildingType, description: building.description, latitude: building.latitude, longitude: building.longitude, website: building.website, imageName: building.imageName))
            }
        }

        return(BuildingData(name: "Building name", yearOfConstruction: 2000, buildingType: "Muzeum", description: "fnjdsnafjsa", latitude: 22.22222, longitude: 33.33333, website: "wwww.google.com", imageName: "soldek"))
    }
}
