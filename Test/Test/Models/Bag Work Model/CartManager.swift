//
//  CartManager.swift
//  Test
//
//  Created by Гаджи Герейакаев on 30.06.2023.
//

import Foundation
import Combine


enum KeysUserCartDefaults {
    static let cart = "cart"
}

struct Cart: Codable, Equatable {
    var dishes: [Dish]
    var dishesCount: [Int]
}

class CartManager: ObservableObject {
    @Published var totalCost: Int = 0
    static var shared = CartManager()
    
    private let defaultCart = Cart(dishes: [], dishesCount: [])
    
    @Published var currentCart: Cart{
        didSet{
            if let data = try? PropertyListEncoder().encode(currentCart){
                UserDefaults.standard.setValue(data, forKey: KeysUserCartDefaults.cart)
            }
            totalCost = calculateTotalCost()
        }
    }
    
    var countForDish: [Dish: Int] {
        var countDict = [Dish: Int]()
        for (index, dish) in currentCart.dishes.enumerated() {
            countDict[dish] = currentCart.dishesCount[index]
        }
        return countDict
    }
    
    init() {
        if let data = UserDefaults.standard.object(forKey: KeysUserCartDefaults.cart) as? Data {
            currentCart = (try? PropertyListDecoder().decode(Cart.self, from: data)) ?? defaultCart
        } else {
            currentCart = defaultCart
            if let data = try? PropertyListEncoder().encode(defaultCart) {
                UserDefaults.standard.setValue(data, forKey: KeysUserCartDefaults.cart)
            }
        }
        totalCost = calculateTotalCost()
    }
    
    func addDishToCart(dish: Dish) {
        if let index = currentCart.dishes.firstIndex(of: dish) {
            currentCart.dishesCount[index] += 1
        } else {
            currentCart.dishes.append(dish)
            currentCart.dishesCount.append(1)
        }
        saveCartToDefaults()
    }
    
    func removeDishFromCart(dish: Dish) {
        if let index = currentCart.dishes.firstIndex(of: dish) {
            if currentCart.dishesCount[index] > 1 {
                currentCart.dishesCount[index] -= 1
            } else {
                currentCart.dishes.remove(at: index)
                currentCart.dishesCount.remove(at: index)
            }
        }
        
        // Дополнительная проверка на пустоту массивов
        if currentCart.dishes.isEmpty || currentCart.dishesCount.isEmpty {
            currentCart = defaultCart // Восстановление корзины по умолчанию, если оба массива пусты
        }
        
        saveCartToDefaults()
    }


    
    func getCountOfDish(dish: Dish) -> Int {
        if let index = currentCart.dishes.firstIndex(of: dish) {
            return currentCart.dishesCount[index]
        }
        return 0
    }
    
    private func saveCartToDefaults() {
        if let data = try? PropertyListEncoder().encode(currentCart) {
            UserDefaults.standard.setValue(data, forKey: KeysUserCartDefaults.cart)
        }
        totalCost = calculateTotalCost()
    }
    
    private func calculateTotalCost() -> Int {
        var total = 0
        if currentCart.dishesCount.count == currentCart.dishes.count{
            for (index, dish) in currentCart.dishes.enumerated() {
                total += dish.price * currentCart.dishesCount[index]
            }
        }
        
        return total
    }
}
