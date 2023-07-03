//
//  CategoryRow.swift
//  Test
//
//  Created by Гаджи Герейакаев on 28.06.2023.
//

import SwiftUI

struct MainMenuRow: View {
    
    var items: [Category]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                ForEach(self.items) { item in
                    MainMenuItem(object: item)
                }
            }
        }
    }
}

struct MainMenuRow_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuRow(items: categoryMaterials)
    }
}
