//
//  Data.swift
//  Test
//
//  Created by Гаджи Герейакаев on 28.06.2023.
//

import Foundation
import SwiftUI

var dishesMaterials: [Dish] = []
var categoryMaterials: [Category] = []

class LoadData: ObservableObject {
    @Published var dishesData: [Dish] = [] // Массив данных блюд
    @Published var categoryData: [Category] = [] // Массив данных категорий
    
    private let dishesURL = "https://run.mocky.io/v3/aba7ecaa-0a70-453b-b62d-0e326c859b3b"
    private let categoryURL = "https://run.mocky.io/v3/058729bd-1402-4578-88de-265481fd7d54"
    
    // Метод для загрузки и разбора JSON-данных из URL-адреса
    func parseJSONFromURL(urlString: String, completion: @escaping ([[String: Any]]?, Error?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil, NSError(domain: "InvalidURL", code: 0, userInfo: nil))
            return
        }
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(nil, error)
                return
            }
            
            guard let jsonData = data else {
                completion(nil, NSError(domain: "NoData", code: 0, userInfo: nil))
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any]
                
                guard let jsonArray = json else {
                    completion(nil, NSError(domain: "InvalidJSON", code: 0, userInfo: nil))
                    return
                }
                
                // Получение массива значений из словаря JSON
                if let array = jsonArray.values.first as? [[String: Any]] {
                    completion(array, nil)
                } else {
                    completion(nil, NSError(domain: "InvalidJSON", code: 0, userInfo: nil))
                }
                
            } catch {
                completion(nil, error)
            }
        }
        
        task.resume()
    }
    
    // Метод для загрузки данных категорий
    func loadCategory() {
        parseJSONFromURL(urlString: categoryURL) { (categoryJSONArray, error) in
            if let error = error {
                print("Error parsing category JSON: \(error.localizedDescription)")
                return
            }
            
            if let categoryJSONArray = categoryJSONArray {
                // Обработка массива категорий
                
                DispatchQueue.main.async {
                    for categoryDict in categoryJSONArray {
                        if let id = categoryDict["id"] as? Int,
                           let name = categoryDict["name"] as? String,
                           let imageUrl = categoryDict["image_url"] as? String {
                            
                            let category = Category(id: id, name: name, image_url: imageUrl)
                            self.categoryData.append(category)
                        }
                    }
                }
            }
        }
    }

    // Метод для загрузки данных блюд
    func loadDish() {
        parseJSONFromURL(urlString: dishesURL) { (dishJSONArray, error) in
            if let error = error {
                print("Error parsing dish JSON: \(error.localizedDescription)")
                return
            }
            
            if let dishJSONArray = dishJSONArray {
                // Обработка массива блюд
                
                DispatchQueue.main.async {
                    for dishDict in dishJSONArray {
                        if let id = dishDict["id"] as? Int,
                           let name = dishDict["name"] as? String,
                           let price = dishDict["price"] as? Int,
                           let weight = dishDict["weight"] as? Int,
                           let description = dishDict["description"] as? String,
                           let imageUrl = dishDict["image_url"] as? String,
                           let tegs = dishDict["tegs"] as? [String] {
                            
                            let dish = Dish(id: id, name: name, price: price, weight: weight, description: description, image_url: imageUrl, tegs: tegs)
                            self.dishesData.append(dish)
                        }
                    }
                }
            }
        }
    }
}
