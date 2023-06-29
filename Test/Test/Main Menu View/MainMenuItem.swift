//
//  CategoryItem.swift
//  Test
//
//  Created by Гаджи Герейакаев on 28.06.2023.
//

import SwiftUI

struct MainMenuItem: View {
    public var object: Category
    private var categoryBackgroundImage: Image {
        loadImageFromURL(urlString: self.object.image_url)
    }
    @State private var isActive: Bool = false
//    private var colors: [Color] = [Color(red: 1, green: 0.95, blue: 0.82), Color(red: 1, green: 0.92, blue: 0.88), Color(red: 0.85, green: 0.96, blue: 0.95), Color(red: 0.94, green: 0.96, blue: 0.81)]
    var body: some View {
        Button(action: {
            isActive = true
        }) {
            ZStack {
                categoryBackgroundImage
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipped()
                
                Text(object.name)
                    .font(
                        Font.custom("SF Pro Display", size: 20)
                            .weight(.medium)
                    )
                    .kerning(0.2)
                    .foregroundColor(.black)
                    .frame(width: 191, height: 50, alignment: .leading)
                    .offset(x: -65, y: -40)
            }
        }
        .frame(width: 343, height: 148)
        .cornerRadius(10)
        .background(
            NavigationLink(destination: CategoryView(object: object), isActive: $isActive) {
                EmptyView()
            }
            .hidden()
        )


            
        
    }
}

struct MainMenuItem_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuItem(object: categoryMaterials[0])
    }
}
