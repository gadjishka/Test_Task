//
//  CategoryRow.swift
//  Test
//
//  Created by Гаджи Герейакаев on 28.06.2023.
//

import SwiftUI

struct CategoryRow: View {
    var items: [Dish]
    @State var showProfile = false
    @State var selectedDish = 0
    private var imageOfSelectedDish: Image {
            loadImageFromURL(urlString: self.items[selectedDish].image_url)
    }

    var body: some View {
        ZStack {
            ScrollView {
                VStack(spacing: 30) {
                    ForEach(0..<items.count/3, id: \.self) { rowIndex in
                        HStack(spacing: 10) {
                            ForEach(0..<3, id: \.self) { columnIndex in
                                let index = rowIndex * 3 + columnIndex
                                if index < items.count {
                                    Button {
                                        self.showProfile = true
                                        self.selectedDish = index
                                    } label: {
                                        CategoryItem(object: items[index])
                                    }
                                    
                                } else {
                                    // Заполнитель для пустых ячеек
                                    Color.clear
                                }
                            }
                        }
                    }
                }
                .padding()
            }
            ProductView(object: items[selectedDish], dishImage: imageOfSelectedDish, showProfile: $showProfile)
                .offset(y: showProfile ? 0 : 1000)
                .animation(.spring(response: 0.3, dampingFraction: 1, blendDuration: 0))
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRow(items: dishesMaterials)
    }
}
