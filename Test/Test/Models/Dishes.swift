//
//  DishesModelData.swift
//  Test
//
//  Created by Гаджи Герейакаев on 28.06.2023.
//

import Foundation

struct Dish: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var price: Int
    var weight: Int
    var description: String
    var image_url: String
    var tegs: [String]
}
