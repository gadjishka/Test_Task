//
//  CategoryView.swift
//  Test
//
//  Created by Гаджи Герейакаев on 28|06|2023|
//

import SwiftUI

struct CategoryView: View {
    let object: Category
    let items: [Dish]
    @Environment(\.presentationMode) var presentationMode 
    @State private var dishesFiltered: [Dish] = []
    @State private var buttonStates: [Bool] = [true, false, false, false, false]
    private let buttonsNames: [String] = ["Все меню", "Салаты", "С рисом", "С рыбой", "Роллы"]
    
    var body: some View {
        VStack {
            // Горизонтальная прокрутка для кнопок фильтрации
            ScrollView(.horizontal) {
                HStack(alignment: .top, spacing: 10) {
                    ForEach(Array(buttonsNames.enumerated()), id: \.element) { index, name in
                        Button(action: {
                            filtering(index: index, name: name)
                        }) {
                            Text(name)
                                .font(Font.custom("SF Pro Display", size: 14))
                                .kerning(0.14)
                                .foregroundColor(getButtonTextColor(forIndex: index))
                                .cornerRadius(10)
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 10)
                        .background(getButtonBackgroundColor(forIndex: index))
                        .cornerRadius(10)
                    }
                }
                .padding()
            }
            
            // Отображение блюд в строках с прокруткой
            CategoryRow(items: dishesFiltered)
        }
        .background(Color.white) // Фоновый цвет для всего CategoryView
        .navigationBarTitle(Text(object.name))
        .navigationBarTitleDisplayMode(.automatic)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
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
        }
            .disabled(true)
        )
        .onAppear {
            filtering(index: 0, name: "Все меню")
       }
    }
    
    private func filtering(index: Int, name: String) {
        self.updateButtonStates(index: index)
        self.dishesFiltered = Filtering().filterItemsByTeg(dishes: items, teg: name)
    }
    
    // Кнопка "Назад" в навигационной панели
    private var backButton: some View {
        Button(action: {
            goBack()
        }) {
            Image("backButton")
                .padding(.leading, 8)
                .padding(.trailing, 10)
                .padding(.vertical, 5)
                .frame(width: 32, height: 32, alignment: .center)
                .cornerRadius(50)
        }
        .onTapGesture {
            goBack()
        }
    }
    
    // Функция для перехода назад
    private func goBack() {
        presentationMode.wrappedValue.dismiss()
    }
    
    // Получение цвета фона кнопки в зависимости от состояния
    private func getButtonBackgroundColor(forIndex index: Int) -> Color {
        return buttonStates[index] ? Color(red: 0.2, green: 0.39, blue: 0.88) : Color(red: 0.97, green: 0.97, blue: 0.96)
    }
    
    // Получение цвета текста кнопки в зависимости от состояния
    private func getButtonTextColor(forIndex index: Int) -> Color {
        return buttonStates[index] ? .white : .black
    }
    
    // Обновление состояний кнопок фильтрации
    private func updateButtonStates(index: Int) {
        buttonStates = buttonStates.enumerated().map { (buttonIndex, _) in
            return buttonIndex == index
        }
    }
}


struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(object: categoryMaterials[0], items: dishesMaterials)
    }
}
