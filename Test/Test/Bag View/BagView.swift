//
//  BagView.swift
//  Test
//
//  Created by Гаджи Герейакаев on 29.06.2023.
//

import SwiftUI

struct BagView: View {
    var body: some View {
        VStack{
            BagRow(bagItems: dishesMaterials)
            Button {
                //
            } label: {
                ZStack {
                    Text("Оплатить 2 004 ₽")
                        .font(
                            Font.custom("SF Pro Display", size: 16)
                                .weight(.medium)
                        )
                        .kerning(0.1)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                    Color.clear
                        .contentShape(Rectangle())
                        .frame(width: 343, height: 48)
                }
                
                
            }
            .frame(width: 343, height: 48, alignment: .center)
            .background(Color(red: 0.2, green: 0.39, blue: 0.88))
            .cornerRadius(10)
            .padding(15)
            .background(Color.clear)
            
        }
        
    }
}

struct BagView_Previews: PreviewProvider {
    static var previews: some View {
        BagView()
    }
}
