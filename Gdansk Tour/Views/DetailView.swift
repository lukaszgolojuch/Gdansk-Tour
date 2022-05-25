//
//  DetailView.swift
//  Gdansk Tour
//
//  Created by Łukasz Gołojuch on 5/24/22.
//

import SwiftUI
import MapKit

struct DetailView: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    
    var body: some View {
        NavigationView{
            VStack{
                ZStack{
                    Image("example_image")
                        .resizable()
                        .scaledToFit()
                        .edgesIgnoringSafeArea(.all)
                Map(coordinateRegion: $region)
                            .frame(width: 300, height: 200)
                            .clipShape(Circle())
                            .offset(x: 0, y: -20)
                }
                List {
                    Section(header: Text("Informacje ogólne")) {
                        Text("Nazwa:")
                        Text("Rok budowy:")
                        Text("Typ:")
                            
                    }

                    Section(header: Text("Opis")) {
                        Text("Lorem Ipsum")
                    }
                        
                    Section(header: Text("Strona internetowa")) {
                        Text("Lorem Ipsum")
                    }
                }
                .offset(x: 0, y: 0)
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
