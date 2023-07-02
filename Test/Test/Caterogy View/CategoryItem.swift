//
//  CategoryItem.swift
//  Test
//
//  Created by Гаджи Герейакаев on 28.06.2023.
//

import SwiftUI

struct CategoryItem: View {
    public var object: Dish
    @State private var categoryBackgroundImage: Image?
    
    private func loadCategoryBackgroundImage() async {
        categoryBackgroundImage = await loadImageFromURL(urlString: object.image_url)
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            if let image = categoryBackgroundImage {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 87, height: 98)
                    .clipped()
                    .padding(EdgeInsets(top: 13, leading: 16, bottom: 0, trailing: 13))
                    .background(Color(red: 0.97, green: 0.97, blue: 0.96))
                    .cornerRadius(10)
            } else {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 87, height: 98)
                    .background(Color(red: 0.97, green: 0.97, blue: 0.96))
                    .cornerRadius(10)
            }
            
            Text(object.name)
                .font(Font.custom("SF Pro Display", size: 14))
                .kerning(0.14)
                .foregroundColor(.black)
                .multilineTextAlignment(.leading)
                .frame(width: 112, height: 35, alignment: .leading)
        }
        .task {
            await loadCategoryBackgroundImage()
        }
    }
}



struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(object: dishesMaterials[5])
    }
}
