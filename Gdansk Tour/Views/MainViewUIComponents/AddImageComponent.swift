//
//  AddImageComponent.swift
//  Gdansk Tour
//
//  Created by Łukasz Gołojuch on 5/27/22.
//

import SwiftUI

struct AddImageComponent: View {
    let jsonController = JSONController()
    
    @State var isPresenting: Bool = false
    @State var moveToDetailView: Bool = false
    @State var uiImage: UIImage?
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    @State var building: BuildingData?
    
    let appColors = AppColors()
    @ObservedObject var classifier: ImageClassifier
    
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Rozpoznanie obiektu")
                .multilineTextAlignment(.leading)
                .padding()
                .fixedSize(horizontal: false, vertical: true)
                .font(.title)
                .foregroundColor(appColors.darkBlue)
            
            HStack{
            
//MARK: - Add photo from camera
                Button(action: {
                    isPresenting = true
                    sourceType = .camera
                    
                }) {
                    Image("camera_icon")
                        .resizable()
                        .frame(width: 100, height: 100, alignment: .trailing)
                        .clipShape(Circle())
                        .shadow(radius: 10)
                        .overlay(Circle().stroke(appColors.overlayColor, lineWidth: 2))
                        .overlay(NavigationLink(destination: DetailView(building: building ?? BuildingData(name: "Building name", yearOfConstruction: 2000, buildingType: "Muzeum", description: "fnjdsnafjsa", latitude: 22.22222, longitude: 33.33333, website: "wwww.google.com", imageName: "soldek")), isActive: $moveToDetailView, label: {
                                        EmptyView()
                                    }))
                }
                
                Spacer()
                
//MARK: - Add photo from gallery
                Button(action: {
                    isPresenting = true
                    sourceType = .photoLibrary
                }) {
                    Text("Dodaj zdjęcie z galerii")
                }
                    .foregroundColor(.white)
                    .shadow(radius: 10)
                    .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
                    .background(appColors.buttonBackgroundColor)
                    .clipShape(Capsule())
                    .overlay(Capsule().stroke(appColors.overlayColor, lineWidth: 2))
                    .overlay(NavigationLink(destination: DetailView(building: building ?? BuildingData(name: "Building name", yearOfConstruction: 2000, buildingType: "Muzeum", description: "fnjdsnafjsa", latitude: 22.22222, longitude: 33.33333, website: "wwww.google.com", imageName: "soldek")), isActive: $moveToDetailView, label: {
                                    EmptyView()
                                }))
            }
        }
        .sheet(isPresented: $isPresenting){
            ImagePicker(uiImage: $uiImage, isPresenting:  $isPresenting, sourceType: $sourceType)
                .onDisappear{
                    if uiImage != nil {
                        classifier.detect(uiImage: uiImage!)
                        building = jsonController.getBuildingData(searchedName: classifier.imageClass ?? "Sołdek")
                        moveToDetailView = true
                    }
                }
            
        }
    }
}

struct AddImageComponent_Previews: PreviewProvider {
    static var previews: some View {
        AddImageComponent(classifier: ImageClassifier())
    }
}
