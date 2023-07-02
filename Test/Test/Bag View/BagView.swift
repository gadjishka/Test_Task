//
//  BagView.swift
//  Test
//
//  Created by Гаджи Герейакаев on 29.06.2023.
//

import SwiftUI

struct BagView: View {
    @EnvironmentObject private var cartManager: CartManager
    @State private var totalCost: Int = 0
    
    init() {
        _totalCost = State(initialValue: 0)
    }
    
    var body: some View {
        VStack {
            BagRow(bagItems: cartManager.currentCart.dishes)
            
            Button(action: {
                // Действия при нажатии кнопки оплаты
            }) {
                ZStack {
                    Text("Оплатить \(totalCost) ₽")
                        .font(Font.custom("SF Pro Display", size: 16).weight(.medium))
                        .kerning(0.1)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                    
                    Color.clear
                        .contentShape(Rectangle())
                        .frame(width: 343, height: 48)
                }
            }
            .frame(width: 343, height: 48)
            .background(Color(red: 0.2, green: 0.39, blue: 0.88))
            .cornerRadius(10)
            .padding(15)
            .background(Color.clear)
        }
        .environmentObject(CartManager.shared)
        .onReceive(cartManager.$totalCost) { newTotalCost in
            totalCost = newTotalCost
        }
    }
}



struct BagView_Previews: PreviewProvider {
    static var previews: some View {
        BagView()
            .environmentObject(CartManager.shared) // Добавляем CartManager в окружение
    }
}
