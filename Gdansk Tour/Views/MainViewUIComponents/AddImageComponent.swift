//
//  AddImageComponent.swift
//  Gdansk Tour
//
//  Created by Łukasz Gołojuch on 5/27/22.
//

import SwiftUI

struct AddImageComponent: View {
    @State var isPresenting: Bool = false
    @State var moveToDetailView: Bool = false
    @State var uiImage: UIImage?
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
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
                        .overlay(NavigationLink(destination: DetailView(buildingDetails: Building(Name: "Muzeum wojenne", YearOfConstruction: 2015, BuildingType: .museum, Description: "Muzeum drugiej wojny światowej opowiadające o drugiej wojnie światowej", Latitude: 51.507222, Longitude: -0.1275, Website: URL(string: "www.muzeum.pl")!, ImageName: "muzeumwojny")), isActive: $moveToDetailView, label: {
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
                    .overlay(NavigationLink(destination: DetailView(buildingDetails: Building(Name: "Muzeum wojenne", YearOfConstruction: 2015, BuildingType: .museum, Description: "Muzeum drugiej wojny światowej opowiadające o drugiej wojnie światowej", Latitude: 51.507222, Longitude: -0.1275, Website: URL(string: "www.muzeum.pl")!, ImageName: "muzeumwojny")), isActive: $moveToDetailView, label: {
                                    EmptyView()
                                }))
            }
        }
        .sheet(isPresented: $isPresenting){
            ImagePicker(uiImage: $uiImage, isPresenting:  $isPresenting, sourceType: $sourceType)
                .onDisappear{
                    if uiImage != nil {
                        classifier.detect(uiImage: uiImage!)
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
