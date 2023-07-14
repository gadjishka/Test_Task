//
//  ImageLoader.swift
//  Test
//
//  Created by Гаджи Герейакаев on 03.07.2023.
//

import SwiftUI

// Класс для загрузки изображений по URL
class ImageLoader: ObservableObject {
    @Published var image: Image? // Опубликованное свойство, которое будет отслеживаться для изменений
    private let urlString: String // URL-адрес изображения
    
    init(urlString: String) {
        self.urlString = urlString
        loadImageFromURL() // Загрузка изображения при инициализации
    }
    
    private func loadImageFromURL() {
        Task {
            // Проверяем наличие изображения в кэше
            if let cachedImage = ImageCache.shared.getImage(urlString: urlString) {
                DispatchQueue.main.async {
                    self.image = cachedImage
                }
                return
            }
            
            // Создаем URL из строки
            guard let url = URL(string: urlString) else {
                DispatchQueue.main.async {
                    self.image = Image(systemName: "photo") // Устанавливаем изображение по умолчанию, если URL некорректный
                }
                return
            }
            
            do {
                // Загружаем данные изображения по URL
                let (data, _) = try await URLSession.shared.data(from: url)
                
                // Преобразуем данные в UIImage
                if let uiImage = UIImage(data: data) {
                    let image = Image(uiImage: uiImage)
                    ImageCache.shared.setImage(image, urlString: urlString) // Сохраняем изображение в кэше
                    Task {
                        await MainActor.run {
                            self.image = image // Устанавливаем изображение в свойство с использованием главной очереди
                        }
                    }
                }
            } catch {
                print("Error loading image: \(error)")
                Task {
                    await MainActor.run {
                        self.image = Image(systemName: "photo") // Устанавливаем изображение по умолчанию в случае ошибки загрузки
                    }
                }
            }
        }
    }
}

