//
//  DetailView.swift
//  Gdansk Tour
//
//  Created by Łukasz Gołojuch on 5/24/22.
//

import SwiftUI
import MapKit

struct DetailView: View {
    
    let buildingData: BuildingData
    @State private var isActive: Bool = false
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 54.356069, longitude: 18.659916), span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005))
    
    var body: some View {
        VStack {
            Image((buildingData.imageName))
                .resizable()
                .scaledToFill()
                .ignoresSafeArea(edges: .top)
                .frame(height: getPhotoHeight())

            NavigationLink {
                MapView()
            } label: {
                    Map(coordinateRegion: $region)
                        .frame(width: 300, height: 200)
                        .clipShape(Circle())
                        .overlay {
                            Circle().stroke(Color(red: 45/255, green: 49/255, blue: 250/255), lineWidth: 2)
                        }
                        .shadow(radius: 7)
                        .offset(y: -getMapOffset())
                        .padding(.bottom, -130)
            }
            ScrollView{
                VStack(alignment: .leading) {
                    Text(buildingData.name )
                        .font(.title)

                    HStack {
                        Text("Typ: " + (buildingData.buildingType ))
                            .font(.subheadline)
                        Spacer()
                        Text(String(buildingData.yearOfConstruction ))
                            .font(.subheadline)
                    }
                        .padding([.top, .bottom], 3)

                    Divider()

                    Text("Opis")
                        .font(.title2)
                    Text(buildingData.description )
                        .padding(.top, 10)
                }
                .padding()
            }

            Spacer()
        }
    }
    
    func getPhotoHeight() -> CGFloat {
        return (UIScreen.main.bounds.height / 4)
    }
    
    func getMapOffset() -> CGFloat {
        return (UIScreen.main.bounds.height / 6.5)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(buildingData: BuildingData(name: "Building name", yearOfConstruction: 2000, buildingType: "Muzeum", description: "fnjdsnafjsa", latitude: 22.22222, longitude: 33.33333, website: "wwww.google.com", imageName: "soldek"))
    }
}

struct MyAnnotationItem: Identifiable {
    var coordinate: CLLocationCoordinate2D
    let id = UUID()
}
