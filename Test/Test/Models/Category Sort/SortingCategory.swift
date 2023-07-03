//
//  SortingCategory.swift
//  Test
//
//  Created by Гаджи Герейакаев on 30.06.2023.
//

import Foundation

class Filtering {
    let data: [Dish] = []
    
    func filterItemsByTeg(dishes: [Dish],teg: String) -> [Dish] {
        
        let filteredDishes = dishes.filter { $0.tegs.contains(teg) }
        
        return filteredDishes != [] ? filteredDishes : []
    }
}
