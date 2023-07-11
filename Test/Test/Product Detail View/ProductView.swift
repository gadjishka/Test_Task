//
//  testing.swift
//  Test
//
//  Created by Гаджи Герейакаев on 29.06.2023.
//

import SwiftUI

struct ProductView: View {
    @ObservedObject private var imageLoader: ImageLoader
    @EnvironmentObject var cartManager: CartManager
    private let object: Dish
    @Binding var showProfile: Bool
    
    init(object: Dish, showProfile: Binding<Bool>) {
        let imageLoader = ImageLoader(urlString: object.image_url)
        self.imageLoader = imageLoader
        self.object = object
        _showProfile = showProfile
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .background(.black.opacity(0.4))
                VStack {
                    VStack(spacing: 8) {
                        ZStack {
                            if let image = imageLoader.image {
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 198, height: 204)
                                    .background(
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .clipped()
                                    )
                            }
                            VStack {
                                HStack {
                                    Spacer()
                                    Button {
                                        //
                                    } label: {
                                        ButtonView(symbol: "heart")
                                    }
                                    Button {
                                        showProfile.toggle()
                                    } label: {
                                        ButtonView(symbol: "xmark")
                                    }
                                }
                                .padding(.top, 7)
                                .padding(.trailing, 7)
                                Spacer()
                            }
                        }
                        .frame(width: 311, height: 232)
                        .background(Color(red: 0.97, green: 0.97, blue: 0.96))
                        .cornerRadius(10)
                    }
                    
                    VStack(alignment: .leading) {
                        DetailProductText(name: object.name)
                            .font(
                                Font.custom("SF Pro Display", size: 16)
                                    .weight(.medium)
                            )
                            .kerning(0.16)
                            .foregroundColor(.black)
                        HStack {
                            DetailProductText(name: "\(object.price)₽")
                            DetailProductText(name: "· \(object.weight)г")
                                .contrast(0.2)
                        }
                        
                        DetailProductText(name: object.description)
                            .foregroundColor(.black.opacity(0.65))
                            .frame(width: 311, height: 80, alignment: .leading)
                    }
                    
                    HStack(alignment: .center, spacing: 0) {
                        Button {
                            cartManager.addDishToCart(dish: object)
                        } label: {
                            ZStack{
                                Text("Добавить в корзину")
                                    .font(
                                        Font.custom("SF Pro Display", size: 16)
                                            .weight(.medium)
                                    )
                                    .kerning(0.1)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.white)
                                Color.clear
                                    .contentShape(Rectangle())
                                    .frame(width: 311, height: 48)
                            }
                            
                        }
                    }
                    .padding(0)
                    .frame(width: 311, height: 48, alignment: .center)
                    .background(Color(red: 0.2, green: 0.39, blue: 0.88))
                    .cornerRadius(10)
                }
                .frame(width: 343, height: 446)
                .background(.white)
                .cornerRadius(15)
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .background(.white.opacity(0.4))
            .cornerRadius(4)
        }
        
    }
}

struct DetailProductText: View {
    var name: String
    
    var body: some View {
        VStack {
            Text(name)
                .font(
                    Font.custom("SF Pro Display", size: 14)
                        .weight(.medium)
                )
                .kerning(0.14)
                .foregroundColor(.black)
        }
    }
}

struct ButtonView: View {
    var symbol: String
    
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            Image(systemName: symbol)
                .frame(width: 24, height: 24)
                .fontWeight(.bold)
                .foregroundColor(.black)
        }
        .padding(10)
        .frame(width: 40, height: 40, alignment: .center)
        .background(.white)
        .cornerRadius(8)
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView(object: dishesMaterials[0], showProfile: .constant(true))
    }
}
