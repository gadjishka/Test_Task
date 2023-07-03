//
//  ImageCache.swift
//  Test
//
//  Created by Гаджи Герейакаев on 03.07.2023.
//

import Foundation
import SwiftUI

class ImageCache {
    static let shared = ImageCache()
    private var cache: [String: Image] = [:]
    
    private init() {}
    
    func getImage(urlString: String) -> Image? {
        return cache[urlString]
    }
    
    func setImage(_ image: Image, urlString: String) {
        cache[urlString] = image
    }
}
