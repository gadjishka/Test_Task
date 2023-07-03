//
//  CategoryItem.swift
//  Test
//
//  Created by Гаджи Герейакаев on 28.06.2023.
//

import SwiftUI

struct CategoryItem: View {
    @ObservedObject private var imageLoader: ImageLoader
    private let placeholderImage = Image(systemName: "photo") // Заглушка для изображения
    private let object: Dish // Объект блюда
    
    init(object: Dish) {
        let imageLoader = ImageLoader(urlString: object.image_url)
        self.imageLoader = imageLoader
        self.object = object // Добавлено
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            // Отображение изображения блюда, если доступно
            if let image = imageLoader.image {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 87, height: 98)
                    .clipped()
                    .padding(EdgeInsets(top: 13, leading: 16, bottom: 0, trailing: 13))
                    .background(Color(red: 0.97, green: 0.97, blue: 0.96))
                    .cornerRadius(10)
            } else {
                // Если изображение не доступно, отображается заглушка
                placeholderImage
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 87, height: 98)
                    .clipped()
                    .padding(EdgeInsets(top: 13, leading: 16, bottom: 0, trailing: 13))
                    .background(Color(red: 0.97, green: 0.97, blue: 0.96))
                    .cornerRadius(10)
            }
            
            // Название блюда
            Text(object.name) // Исправлено
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

