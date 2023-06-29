//
//  testing.swift
//  Test
//
//  Created by Гаджи Герейакаев on 29.06.2023.
//

import SwiftUI

// xmark
// heart

struct ProductView: View {
    var object: Dish
    var dishImage: Image
    @Binding var showProfile: Bool
    
    var body: some View {
        VStack {
            VStack(spacing: 8) {
                ZStack{
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 198, height: 204)
                        .background(
                            dishImage
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                            //.frame(width: 198, height: 204)
                                .clipped()
                        )
                    VStack {
                        HStack{
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
                        } .padding(.top, 7)
                            .padding(.trailing, 7)
                        Spacer()
                    }
                    
                } .frame(width: 311, height: 232)
                    .background(Color(red: 0.97, green: 0.97, blue: 0.96))
                    .cornerRadius(10)
                
            }
            
            VStack (alignment: .leading) {
                DetailProductText(name: object.name)
                    .font(
                        Font.custom("SF Pro Display", size: 16)
                            .weight(.medium)
                    )
                    .kerning(0.16)
                    .foregroundColor(.black)
                HStack{
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
                    //
                } label: {
                    Text("Добавить в корзину")
                        .font(
                            Font.custom("SF Pro Display", size: 16)
                                .weight(.medium)
                        )
                        .kerning(0.1)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                }
                
            }
            .padding(0)
            .frame(width: 311, height: 48, alignment: .center)
            .background(Color(red: 0.2, green: 0.39, blue: 0.88))
            .cornerRadius(10)
            
        } .frame(width: 343, height: 446)
            .background(.white)
            .cornerRadius(15)
    }
}




struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView(object: dishesMaterials[2], dishImage: Image("fish"), showProfile: .constant(true))
    }
}

struct DetailProductText: View {
    var name: String
    var body: some View {
        VStack() {
            Text(name)
                .font(
                    Font.custom("SF Pro Display", size: 14)
                        .weight(.medium)
                )
                .kerning(0.14)
                .foregroundColor(.black)
            
            //            Text("\(object.price)₽  \(object.weight)г")
            //                .frame(width: 311,alignment: .leading)
            //                .font(Font.custom("SF Pro Display", size: 14))
            //                .kerning(0.14)
            //                .foregroundColor(.black)
            //
            //            Text(object.description)
            //                .font(Font.custom("SF Pro Display", size: 14))
            //                .kerning(0.14)
            //                .foregroundColor(.black.opacity(0.65))
            //
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
