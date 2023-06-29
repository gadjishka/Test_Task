//
//  HomeScreen.swift
//  Test
//
//  Created by Гаджи Герейакаев on 28.06.2023.
//

import SwiftUI



struct HomeScreen: View {
    
    var items: [Category]
    
    var body: some View {
        NavigationStack {
            VStack {
                MainMenuRow(items: items)
            }
            .navigationBarItems(
                leading: Button(action: {
                    // Действие для левой кнопки
                }) {
                    navigationLeftBarItemView()
                } .disabled(true)
                ,
                trailing: Button(action: {
                    // Действие для правой кнопки
                }) {
                    Text("")
                        .frame(width: 44, height: 44)
                        .background(
                        Image("userIcon")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 44, height: 44)
                        .clipped()
                        )
                        .background(.white)
                        .cornerRadius(100)
                } .disabled(true)
            )
        }
    }
}


struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen(items: categoryMaterials)
    }
}

struct navigationLeftBarItemView: View {
    var body: some View {
        HStack {
            Text("")
                .frame(width: 24, height: 24)
                .background(
                    Image("location")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 24, height: 24)
                        .clipped()
                )
            VStack(alignment: .leading, spacing: 4) {
                Text("Санкт-Петербург")
                    .font(
                        Font.custom("SF Pro Display", size: 18)
                            .weight(.medium)
                    )
                    .foregroundColor(.black)
                Text("12 Августа, 2023")
                    .font(Font.custom("SF Pro Display", size: 14))
                    .kerning(0.14)
                    .foregroundColor(.black.opacity(0.5))
            } .padding(0)
        }
    }
}
