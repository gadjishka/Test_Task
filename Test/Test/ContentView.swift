//
//  ContentView.swift
//  Test
//
//  Created by Гаджи Герейакаев on 27.06.2023.
//

import SwiftUI

enum Tab {
    case home
    case search
    case bag
    case account
    // добавьте дополнительные вкладки по мере необходимости
}

struct ContentView: View {
    @State private var selectedTab: Tab = .home
    var body: some View {
        
        TabView (selection: $selectedTab){
            // Вкладка 1
            HomeScreen(items: categoryMaterials)
                .tabItem {
                    Image(selectedTab == .home ? "main.blue" : "main")
                    Text("Главная")
                }.tag(Tab.home)
            
            // Вкладка поиск
            Text("Поиск")
                .tabItem {
                    Image("search")
                    Text("Поиск")
                }.tag(Tab.search)
            
            // Вкладка корзина
            BagView()
                .tabItem {
                    Image(selectedTab == .bag ? "bag.blue" : "bag")
                    Text("Корзина")
                }.tag(Tab.bag)
            // Вкладка аккаунт
            Text("Аккаунт")
                .tabItem {
                    Image("account")
                    Text("Аккаунт")
                }.tag(Tab.account)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
