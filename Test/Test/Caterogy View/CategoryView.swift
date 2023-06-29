//
//  CategoryView.swift
//  Test
//
//  Created by Гаджи Герейакаев on 28|06|2023|
//

import SwiftUI

struct CategoryView: View {
    
    let object: Category
    
    var body: some View {
        VStack{
            ScrollView(.horizontal) {
                HStack{
                    SectionButton(title: "Все меню")
                    SectionButton(title: "Салаты")
                    SectionButton(title: "С рисом")
                    SectionButton(title: "С рыбой")
                    SectionButton(title: "Роллы")
                }.padding()
                
                
            }
            
                CategoryRow(items: dishesMaterials)
            
        }
        
        .navigationBarTitle(Text(object.name))
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(trailing: Button(action: {
            // Действие для правой кнопки
        }) {
            Text("")
                .frame(width: 44, height: 44)
                .background(
                    Image("userIcon")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 44, height: 44)
                        .clipped()
                )
                .background(.white)
                .cornerRadius(100)
        } .disabled(true)
        )
    }
}


struct SectionButton: View {
    var title: String
    
    var body: some View {
        Button(action: {
            //
        }) {
            Text(title)
                .font(Font.custom("SF Pro Display", size: 14))
                .kerning(0.14)
                .foregroundColor(.black)
            
        } .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(Color(red: 0.97, green: 0.97, blue: 0.96))
            .cornerRadius(10)
        
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(object: categoryMaterials[0])
    }
}
