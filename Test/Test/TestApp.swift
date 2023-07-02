//
//  TestApp.swift
//  Test
//
//  Created by Гаджи Герейакаев on 27.06.2023.
//

import SwiftUI

@main
struct TestApp: App {
    @StateObject private var cartManager = CartManager.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(cartManager)
        }
    }
}


