//
//  CategoryItem.swift
//  Test
//
//  Created by Гаджи Герейакаев on 28.06.2023.
//

import SwiftUI

struct CategoryItem: View {
    public var object: Dish
    private var categoryBackgroundImage: Image {
        loadImageFromURL(urlString: self.object.image_url)
    }
    //    private var colors: [Color] = [Color(red: 1, green: 0.95, blue: 0.82), Color(red: 1, green: 0.92, blue: 0.88), Color(red: 0.85, green: 0.96, blue: 0.95), Color(red: 0.94, green: 0.96, blue: 0.81)]
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 87, height: 98)
                .background(
                    categoryBackgroundImage
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        //.frame(width: 87, height: 98)
                        .clipped()
                )
                .padding(EdgeInsets(top: 13, leading: 16, bottom: 0, trailing: 13))
                .background(Color(red: 0.97, green: 0.97, blue: 0.96))
                .cornerRadius(10)
            
            Text(object.name)
                .font(Font.custom("SF Pro Display", size: 14))
                .kerning(0.14)
                .foregroundColor(.black)
                .multilineTextAlignment(.leading)
                .frame(width: 112, height: 35, alignment: .leading)
            
        }
        
    }
}


struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(object: dishesMaterials[5])
    }
}
