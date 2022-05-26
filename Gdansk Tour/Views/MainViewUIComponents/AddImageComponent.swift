//
//  AddImageComponent.swift
//  Gdansk Tour
//
//  Created by Łukasz Gołojuch on 5/27/22.
//

import SwiftUI

struct AddImageComponent: View {
    let appColors = AppColors()
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Rozpoznanie obiektu")
                .multilineTextAlignment(.leading)
                .padding()
                .fixedSize(horizontal: false, vertical: true)
                .font(.title)
                .foregroundColor(appColors.darkBlue)
            HStack{
                Button(action: {
                    print("Create photo")
                }) {
                    
                    Image("camera_icon")
                        .resizable()
                        .frame(width: 100, height: 100, alignment: .trailing)
                        .clipShape(Circle())
                        .shadow(radius: 10)
                        .overlay(Circle().stroke(appColors.overlayColor, lineWidth: 2))
                }
                
                Spacer()
                Button(action: {
                    print("Add photo from gallery")
                }) {
                    Text("Dodaj zdjęcie z galerii")
                }
                .foregroundColor(.white)
                .shadow(radius: 10)
                .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
                .background(appColors.buttonBackgroundColor)
                .clipShape(Capsule())
                .overlay(Capsule().stroke(appColors.overlayColor, lineWidth: 2))
            }
        }
    }
}

struct AddImageComponent_Previews: PreviewProvider {
    static var previews: some View {
        AddImageComponent()
    }
}
