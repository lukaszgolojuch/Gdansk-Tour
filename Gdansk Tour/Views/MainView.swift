//
//  ContentView.swift
//  Gdansk Tour
//
//  Created by Łukasz Gołojuch on 5/23/22.
//


import SwiftUI
import MapKit

struct MainView: View {
    let appColors = AppColors()
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    ZStack{
                        Image("gdansk_background")
                            .resizable()
                            .scaledToFill()
                            .ignoresSafeArea(edges: .top)
                            .frame(height: getImageHeight())
                        Spacer()
                    }
                    VStack{
                        Spacer()
                        AddImageComponent( classifier: ImageClassifier())
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 200)
                            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                        
                        Divider()
                        
                        PinMapComponent()
                            .padding(EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20))

                        Spacer()
                    }
                    .frame(width: .infinity, height: getStackHeight(), alignment: .top)
                    .background(appColors.lightBlue)
                    .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
                    .overlay(RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                            .stroke(Color(red: 45/255, green: 49/255, blue: 250/255), lineWidth: 2))
                    .ignoresSafeArea(edges: .bottom)
                }
            }
            .ignoresSafeArea(edges: .all)
        }
    }
    
    func getStackHeight() -> CGFloat {
        return (UIScreen.main.bounds.height * 0.75)
    }
    
    func getImageHeight() -> CGFloat {
        return (UIScreen.main.bounds.height * 0.25)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
