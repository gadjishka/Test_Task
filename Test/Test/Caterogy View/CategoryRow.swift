//
//  CategoryRow.swift
//  Test
//
//  Created by Гаджи Герейакаев on 28.06.2023.
//

import SwiftUI

struct CategoryRow: View {
    var items: [Dish]
    @State private var showProfile = false
    @State private var selectedDish = 0
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(spacing: 30) {
                    // Разделение блюд на строки
                    ForEach(0..<items.count/3 + 1, id: \.self) { row in
                        HStack(spacing: 10) {
                            // Разделение блюд внутри строки
                            ForEach(0..<3) { column in
                                let index = row * 3 + column
                                if index < items.count {
                                    // Кнопка для выбора блюда и отображения профиля
                                    Button {
                                        self.showProfile = true
                                        self.selectedDish = index
                                    } label: {
                                        CategoryItem(object: items[index])
                                    }
                                } else {
                                    Spacer()
                                }
                            }
                        }
                    }
                }
                .padding()
            }
            
            // Отображение профиля блюда при выборе
            if showProfile {
                ProductView(object: items[selectedDish], showProfile: $showProfile)
                    .transition(.move(edge: .bottom))
            }
        }
        .background(Color.white)
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRow(items: dishesMaterials)
    }
}
