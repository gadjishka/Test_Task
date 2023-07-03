//
//  ImageLoader.swift
//  Test
//
//  Created by Гаджи Герейакаев on 03.07.2023.
//

import SwiftUI

// Класс для загрузки изображений по URL
class ImageLoader: ObservableObject {
    @Published var image: Image?
    private let urlString: String
    
    init(urlString: String) {
        self.urlString = urlString
        loadImageFromURL()
    }
    
    private func loadImageFromURL() {
        Task {
            if let cachedImage = ImageCache.shared.getImage(urlString: urlString) {
                self.image = cachedImage
                return
            }
            
            guard let url = URL(string: urlString) else {
                self.image = Image(systemName: "photo") // Заглушка для изображения
                return
            }
            
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                
                if let uiImage = UIImage(data: data) {
                    let image = Image(uiImage: uiImage)
                    ImageCache.shared.setImage(image, urlString: urlString)
                    DispatchQueue.main.async {
                        self.image = image
                    }
                }
            } catch {
                print("Error loading image: \(error)")
                DispatchQueue.main.async {
                    self.image = Image(systemName: "photo") // Заглушка для изображения
                }
            }
        }
    }
}
