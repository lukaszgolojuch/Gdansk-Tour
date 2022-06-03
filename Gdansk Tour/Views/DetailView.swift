//
//  DetailView.swift
//  Gdansk Tour
//
//  Created by Łukasz Gołojuch on 5/24/22.
//

import SwiftUI
import MapKit

struct DetailView: View {
    @State private var isActive: Bool = false
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    
    @State private var building: Building = Building(Name: "Muzeum II wojny światowej", YearOfConstruction: 2015, BuildingType: .museum, Description: "Muzeum drugiej wojny światowej opowiadające o drugiej wojnie światowej", Latitude: 51.507222, Longitude: -0.1275, Website: URL(string: "www.muzeum.pl")!, ImageName: "example_image")
    
    var body: some View {
        VStack {
            Image((building.imageName ?? "camera_icon") ?? "camera_icon")
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

            VStack(alignment: .leading) {
                Text(building.name ?? "Brak nazwy")
                    .font(.title)

                HStack {
                    Text("Typ: " + (building.type?.rawValue ?? "Budynek"))
                        .font(.subheadline)
                    Spacer()
                    Text(String(building.yearOfConstruction ?? 2022))
                        .font(.subheadline)
                }
                    .padding([.top, .bottom], 3)

                Divider()

                Text("Opis")
                    .font(.title2)
                Text(building.description ?? "Brak opisu")
                    .padding(.top, 10)
            }
            .padding()

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
        DetailView()
    }
}

struct MyAnnotationItem: Identifiable {
    var coordinate: CLLocationCoordinate2D
    let id = UUID()
}
