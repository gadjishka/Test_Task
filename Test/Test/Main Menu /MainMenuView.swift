//
//  HomeScreen.swift
//  Test
//
//  Created by Гаджи Герейакаев on 28.06.2023.
//

import SwiftUI
import CoreLocation


struct MainMenuView: View {
    var items: [Category]
    
    var body: some View {
        NavigationStack {
            VStack {
                // Отображение строки главного меню с переданными категориями
                MainMenuRow(items: items)
            }.padding(.top, 15)
            .toolbar {
                // Настройка панели инструментов навигации
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLeftBarItemView()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    // Правая кнопка в панели инструментов
                    Button(action: {
                        // Действие, выполняемое при нажатии на кнопку
                    }) {
                        Image("userIcon")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 44, height: 44)
                            .clipShape(Circle())
                            .padding(4)
                            .background(Color.white.clipShape(Circle()))
                    }
                }
            }
        }
    }
}

struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView(items: categoryMaterials)
    }
}

struct NavigationLeftBarItemView: View {
    @ObservedObject private var locationManager = LocationManager()
    
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
                // Отображение города пользователя и текущей даты
                Text("\(locationManager.userCity)")
                    .font(
                        Font.custom("SF Pro Display", size: 18)
                            .weight(.medium)
                    )
                    .foregroundColor(.black)
                Text(getCurrentDate())
                    .font(Font.custom("SF Pro Display", size: 14))
                    .kerning(0.14)
                    .foregroundColor(.black.opacity(0.5))
            }
            .padding(0)
        }
        .onAppear {
            // Запрос на получение местоположения пользователя
            locationManager.requestLocation()
        }
    }
}

