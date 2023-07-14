//
//  CategoryItem.swift
//  Test
//
//  Created by Гаджи Герейакаев on 28.06.2023.
//

import SwiftUI

struct MainMenuItem: View {
    @ObservedObject private var imageLoader: ImageLoader
    public var object: Category
    @State private var isActive: Bool = false
    @StateObject private var loadData = LoadData()
    
    // Загружает фоновое изображение категории асинхронно
    init(object: Category) {
        let imageLoader = ImageLoader(urlString: object.image_url)
        self.imageLoader = imageLoader
        self.object = object
    }
    
    var body: some View {
        Button(action: {
            isActive = true
        }) {
            ZStack {
                // Отображение фонового изображения категории, если оно доступно
                if let image = imageLoader.image {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipped()
                }
                
                Text(object.name)
                    .font(Font.system(size: 20))
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.leading)
                    .kerning(0.2)
                    .foregroundColor(.black)
                    .frame(width: 191, height: 50, alignment: .leading)
                    .offset(x: -85, y: -50)
            }
        }
        
        // Оформление внешнего вида кнопки
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 148, maxHeight: 148)
        .padding()
        .cornerRadius(10)
        .background(
            // NavigationLink для перехода к экрану категории при активации
            NavigationLink(destination: CategoryView(object: object, items: loadData.dishesData), isActive: $isActive) {
                EmptyView()
            }
                .hidden()
        )
        .onAppear {
            if loadData.dishesData.count == 0 {
                loadData.loadDish()
            }
            
            
        }
    }
}

struct MainMenuItem_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuItem(object: categoryMaterials[0])
    }
}
