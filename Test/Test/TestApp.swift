//
//  TestApp.swift
//  Test
//
//  Created by Гаджи Герейакаев on 27.06.2023.
//

import SwiftUI

@main
struct TestApp: App {
    // Создаем экземпляр объекта `CartManager` с помощью `@StateObject`.
    // `@StateObject` гарантирует, что объект будет создан только один раз
    // и сохранен внутри структуры `TestApp`.
    @StateObject private var cartManager = CartManager.shared
    
    var body: some Scene {
        WindowGroup {
            // Создаем экземпляр `ContentView` и передаем в него `cartManager`
            ContentView()
                .preferredColorScheme(.light)
                .environmentObject(cartManager)
        }
    }
}
