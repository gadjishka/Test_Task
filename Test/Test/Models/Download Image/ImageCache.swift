//
//  ImageCache.swift
//  Test
//
//  Created by Гаджи Герейакаев on 03.07.2023.
//

import Foundation
import SwiftUI

class ImageCache {
    static let shared = ImageCache() // Статический экземпляр для доступа к кэшу
    private var cache: [String: Image] = [:] // Кэш изображений
    private let lock = NSLock() // Объект блокировки для безопасного доступа к кэшу из нескольких потоков
    
    private init() {}
    
    func getImage(urlString: String) -> Image? {
        lock.lock()
        defer {
            lock.unlock()
        }
        
        return cache[urlString] // Возвращаем изображение из кэша по ключу URL-адреса
    }
    
    func setImage(_ image: Image, urlString: String) {
        lock.lock()
        defer {
            lock.unlock()
        }
        
        cache[urlString] = image // Сохраняем изображение в кэше по ключу URL-адреса
    }
}

