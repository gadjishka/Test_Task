//
//  HomeScreen.swift
//  Test
//
//  Created by Гаджи Герейакаев on 28.06.2023.
//

import SwiftUI
import CoreLocation


struct HomeScreen: View {
    
    var items: [Category]
    
    var body: some View {
        NavigationStack {
            VStack {
                MainMenuRow(items: items)
            }.padding(.top, 15)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLeftBarItemView()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        // Действие для правой кнопки
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


struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen(items: categoryMaterials)
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
            locationManager.requestLocation()
        }
    }
}
