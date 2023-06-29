////
////  testMenu.swift
////  Test
////
////  Created by Гаджи Герейакаев on 29.06.2023.
////
//
import SwiftUI

struct testMenu: View {
    @State private var selectedTab: Tab = .home
    
    enum Tab {
        case home
        case settings
        // добавьте дополнительные вкладки по мере необходимости
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Image(systemName: selectedTab == .home ? "house" : "heart")
                    Text("Главная")
                }
                .tag(Tab.home)
            
            SettingsView()
                .tabItem {
                    Image(systemName: selectedTab == .settings ? "gearshape.fill" : "xmark")
                    Text("Настройки")
                }
                .tag(Tab.settings)
        }
        .onAppear {
            UITabBar.appearance().unselectedItemTintColor = UIColor.black
        }
    }
}

struct HomeView: View {
    var body: some View {
        Text("Это вкладка 'Главная'")
    }
}

struct SettingsView: View {
    var body: some View {
        Text("Это вкладка 'Настройки'")
    }
}


struct testMenu_Previews: PreviewProvider {
    static var previews: some View {
        testMenu()
    }
}
