//
//  CategoryView.swift
//  Test
//
//  Created by Гаджи Герейакаев on 28|06|2023|
//

import SwiftUI

struct CategoryView: View {
    
    let object: Category
    
    @State private var buttonStates: [Bool] = [true, false, false, false, false]
    var body: some View {
        VStack{
            ScrollView(.horizontal) {
                HStack(alignment: .top, spacing: 10){
                    Button(action: {
                        self.updateButtonStates(index: 0)
                    }) {
                        Text("Все меню")
                            .font(Font.custom("SF Pro Display", size: 14))
                            .kerning(0.14)
                            .foregroundColor(getButtonTextColor(forIndex: 0))
                            .cornerRadius(10)
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 10)
                    .background(getButtonBackgroundColor(forIndex: 0))
                    .cornerRadius(10)
                    
                    Button(action: {
                        self.updateButtonStates(index: 1)
                    }) {
                        Text("Салаты")
                            .font(Font.custom("SF Pro Display", size: 14))
                            .kerning(0.14)
                            .foregroundColor(getButtonTextColor(forIndex: 1))
                            .cornerRadius(10)
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 10)
                    .background(getButtonBackgroundColor(forIndex: 1))
                    .cornerRadius(10)
                    
                    Button(action: {
                        self.updateButtonStates(index: 2)
                    }) {
                        Text("С рисом")
                            .font(Font.custom("SF Pro Display", size: 14))
                            .kerning(0.14)
                            .foregroundColor(getButtonTextColor(forIndex: 2))
                            .cornerRadius(10)
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 10)
                    .background(getButtonBackgroundColor(forIndex: 2))
                    .cornerRadius(10)
                    Button(action: {
                        self.updateButtonStates(index: 3)
                    }) {
                        Text("С рыбой")
                            .font(Font.custom("SF Pro Display", size: 14))
                            .kerning(0.14)
                            .foregroundColor(getButtonTextColor(forIndex: 3))
                            .cornerRadius(10)
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 10)
                    .background(getButtonBackgroundColor(forIndex: 3))
                    .cornerRadius(10)
                    Button(action: {
                        self.updateButtonStates(index: 4)
                    }) {
                        Text("Роллы")
                            .font(Font.custom("SF Pro Display", size: 14))
                            .kerning(0.14)
                            .foregroundColor(getButtonTextColor(forIndex: 4))
                            .cornerRadius(10)
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 10)
                    .background(getButtonBackgroundColor(forIndex: 4))
                    .cornerRadius(10)
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
    private func getButtonBackgroundColor(forIndex index: Int) -> Color {
        return buttonStates[index] ? Color(red: 0.2, green: 0.39, blue: 0.88) : Color(red: 0.97, green: 0.97, blue: 0.96)
    }
    
    private func getButtonTextColor(forIndex index: Int) -> Color {
        return buttonStates[index] ? .white : .black
    }
    
    private func updateButtonStates(index: Int) {
        buttonStates = buttonStates.enumerated().map { (buttonIndex, _) in
            return buttonIndex == index
        }
    }
}


//struct SectionButton: View {
//    var title: String
//    var index: Int
//
//    var body: some View {
//        Button(action: {
//            self.updateButtonStates(index: index)
//        }) {
//            Text(title)
//                .padding()
//                .foregroundColor(getButtonTextColor(forIndex: index))
//                .background(getButtonBackgroundColor(forIndex: index))
//                .cornerRadius(10)
//
//
//
//            //        } .padding(.horizontal, 16)
//            //            .padding(.vertical, 10)
//            //            .background(getButtonBackgroundColor(forIndex: index))
//            //        //.background(Color(red: 0.97, green: 0.97, blue: 0.96))
//            //            .cornerRadius(10)
//
//        }
//
//
//    }
//
//}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(object: categoryMaterials[0])
    }
}
