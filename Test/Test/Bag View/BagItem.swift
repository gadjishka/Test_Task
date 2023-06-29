//
//  BagItem.swift
//  Test
//
//  Created by Гаджи Герейакаев on 29.06.2023.
//

import SwiftUI

struct BagItem: View {
    @State private var value = 0
    var bagItem: Dish
    private var bagBackgroundImage: Image {
        loadImageFromURL(urlString: self.bagItem.image_url)
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: 8) {
            HStack{
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 48.34863, height: 52.89908)
                    .background(
                        bagBackgroundImage
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 48.34862518310547, height: 52.89908218383789)
                            .clipped()
                    )
                    .padding(.leading, 9.66971)
                    .padding(.trailing, 3.98166)
                    .padding(.top, 7.39448)
                    .padding(.bottom, 1.70644)
                    .background(Color(red: 0.97, green: 0.97, blue: 0.96))
                    .cornerRadius(6)
                VStack(alignment: .leading, spacing: 4) {
                    DetailProductText(name: bagItem.name)
                    HStack{
                        DetailProductText(name: "\(bagItem.price) ₽")
                        DetailProductText(name: "· \(bagItem.weight)г")
                            .contrast(0.2)
                    }
                    
                }
            }.padding(.horizontal)
            Spacer()
            CustomStepper(value: $value, range: 0...15)
                .padding()
        }
    }
}


struct CustomStepper: View {
    @Binding var value: Int
    let range: ClosedRange<Int>
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            Button(action: {
                if value > range.lowerBound {
                    value -= 1
                }
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
                .font(.system(size: 18))
                .foregroundColor(.black)
            
            
            Button(action: {
                if value < range.upperBound {
                    value += 1
                }
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
