//
//  CategoryItem.swift
//  Test
//
//  Created by Гаджи Герейакаев on 28.06.2023.
//

import SwiftUI

struct MainMenuItem: View {
    public var object: Category
    @State private var categoryBackgroundImage: Image?
    @State private var isActive: Bool = false
    
    private func loadCategoryBackgroundImage() async {
        categoryBackgroundImage = await loadImageFromURL(urlString: object.image_url)
    }
    
    var body: some View {
        Button(action: {
            isActive = true
        }) {
            ZStack {
                if let image = categoryBackgroundImage {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipped()
                }
                
                Text(object.name)
                    .font(
                        Font.custom("SF Pro Display", size: 20)
                            .weight(.black)
                    )
                    .multilineTextAlignment(.leading)
                    .kerning(0.2)
                    .foregroundColor(.black)
                    .frame(width: 191, height: 50, alignment: .leading)
                    .offset(x: -80, y: -40)
            }
        }
        
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 148, maxHeight: 148)
        .padding()
        .cornerRadius(10)
        .background(
            NavigationLink(destination: CategoryView(object: object), isActive: $isActive) {
                EmptyView()
            }
                .hidden()
        )
        .task {
            await loadCategoryBackgroundImage()
        }
    }
}

struct MainMenuItem_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuItem(object: categoryMaterials[0])
    }
}
