//
//  Data.swift
//  Test
//
//  Created by Гаджи Герейакаев on 28.06.2023.
//

import Foundation
import SwiftUI

let dishesMaterials: [Dish] = load("dishesModelData")
let categoryMaterials: [Category] = load("categoryModelData")


func load<T: Decodable>(_ filename: String, as type: T.Type = T.self) -> T {
    guard let file = Bundle.main.url(forResource: filename, withExtension: "json")
        else {
            fatalError("Couldn't find \(filename).json in main bundle.")
    }

    do {
        let data = try Data(contentsOf: file)
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't load and parse \(filename).json as \(T.self):\n\(error)")
    }
}


func loadImageFromURL(urlString: String) -> Image {
    guard let url = URL(string: urlString),
          let imageData = try? Data(contentsOf: url),
          let uiImage = UIImage(data: imageData) else {
        return Image(systemName: "photo") // Возвращаем заглушку, если не удалось загрузить изображение
    }
    
    let image = Image(uiImage: uiImage)
    return image
}
