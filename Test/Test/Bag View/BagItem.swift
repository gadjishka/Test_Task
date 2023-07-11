//
//  BagItem.swift
//  Test
//
//  Created by Гаджи Герейакаев on 29.06.2023.
//

import SwiftUI

struct BagItem: View {
    @EnvironmentObject var cartManager: CartManager
    @ObservedObject private var imageLoader: ImageLoader
    private let bagItem: Dish
    
    private let placeholderImage = Image(systemName: "photo") // Заглушка для изображения
    init(bagItem: Dish) {
        let imageLoader = ImageLoader(urlString: bagItem.image_url)
        self.imageLoader = imageLoader
        self.bagItem = bagItem
    }
    
    private func getIndexForDish(_ dish: Dish) -> Int? {
        return cartManager.currentCart.dishes.firstIndex(where: { $0.name == dish.name })
    }
    
    
    var body: some View {
        HStack(alignment: .center, spacing: 8) {
            HStack (alignment: .center, spacing: 0){
                if let image = imageLoader.image {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 48.34863, height: 52.89908)
                        .background(
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 48.34862518310547, height: 52.89908218383789)
                                .clipped()
                        )
                }
            } .padding(.leading, 9.66971)
                .padding(.trailing, 3.98166)
                .padding(.top, 7.39448)
                .padding(.bottom, 1.70644)
                .background(Color(red: 0.97, green: 0.97, blue: 0.96))
                .cornerRadius(6)
            
            
            VStack(alignment: .leading, spacing: 4) {
                DetailProductText(name: bagItem.name)
                HStack {
                    DetailProductText(name: "\(bagItem.price) ₽")
                    DetailProductText(name: "· \(bagItem.weight)г")
                        .contrast(0.2)
                }
            }
            .padding(.horizontal)
            
            Spacer()
            
            if let index = getIndexForDish(bagItem) {
                let value = $cartManager.currentCart.dishesCount[index]
                CustomStepper(dish: bagItem, value: value)
                    .padding()
            }
                
        }.padding(.leading, 16)
    }
}

struct CustomStepper: View {
    @EnvironmentObject var cartManager: CartManager
    var dish: Dish
    @Binding var value: Int
    private let range: ClosedRange<Int> = 0...15
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            Button(action: {
                cartManager.removeDishFromCart(dish: dish)
            }) {
                
                ZStack {
                    Image(systemName: "minus")
                        .font(.system(size: 20))
                        .fontWeight(.medium)
                        .foregroundColor(.black)
                    Color.clear
                        .contentShape(Rectangle())
                        .frame(width: 28, height: 20)
                }
            }
            .buttonStyle(PlainButtonStyle())
            .disabled(value <= 0 ? true : false)
            
            Text("\(value)")
                .font(
                    Font.custom("SF Pro Display", size: 14)
                        .weight(.medium)
                )
                .kerning(0.14)
                .foregroundColor(.black)
            
            
            Button(action: {
                cartManager.addDishToCart(dish: dish)
            }) {
                Image(systemName: "plus")
                    .font(.system(size: 20))
                    .fontWeight(.medium)
                    .foregroundColor(.black)
            }
            .buttonStyle(PlainButtonStyle())
            .disabled(value >= 15 ? true : false)
        }
        .frame(width: 110)
        .padding(.horizontal, 10)
        .padding(.vertical, 4)
        .background(Color(red: 0.94, green: 0.93, blue: 0.93))
        .cornerRadius(10)
        
    }
}
struct BagItem_Previews: PreviewProvider {
    static var previews: some View {
        BagItem(bagItem: dishesMaterials[0])
    }
}
