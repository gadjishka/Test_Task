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
}

struct ContentView: View {
    @State private var selectedTab: Tab = .home
    @EnvironmentObject private var cartManager: CartManager
    @StateObject private var loadData = LoadData()
    
    var body: some View {
        TabView(selection: $selectedTab) {
            // Вкладка 1: Главная
            MainMenuView(items: loadData.categoryData)
                .tabItem {
                    Image(selectedTab == .home ? "main.blue" : "main")
                    Text("Главная")
                }.tag(Tab.home)
            
            // Вкладка 2: Поиск
            Text("Раздел находится в разработке")
                .tabItem {
                    Image("search")
                    Text("Поиск")
                }.tag(Tab.search)
            
            // Вкладка 3: Корзина
            BagView()
                .environmentObject(cartManager)
                .tabItem {
                    Image(selectedTab == .bag ? "bag.blue" : "bag")
                    Text("Корзина")
                }.tag(Tab.bag)
            
            // Вкладка 4: Аккаунт
            Text("Раздел находится в разработке")
                .tabItem {
                    Image("account")
                    Text("Аккаунт")
                }.tag(Tab.account)
        }
        .onAppear {
            loadData.loadCategory()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(CartManager())
    }
}
