//
//  BagRow.swift
//  Test
//
//  Created by Гаджи Герейакаев on 29.06.2023.
//

import SwiftUI

struct BagRow: View {
    @EnvironmentObject var cartManager: CartManager
    var bagItems: [Dish]
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .center, spacing: 15) {
                    ForEach(self.bagItems) { item in
                        if self.cartManager.getCountOfDish(dish: item) != 0 {
                            BagItem(bagItem: item)
                        }
                    }
                }
            }
        } .background(Color.white)
    }
}
struct BagRow_Previews: PreviewProvider {
    static var previews: some View {
        BagRow(bagItems: dishesMaterials)
            .environmentObject(CartManager.shared)
    }
}

