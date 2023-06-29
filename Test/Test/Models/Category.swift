//
//  CategoryModelData.swift
//  Test
//
//  Created by Гаджи Герейакаев on 28.06.2023.
//

import Foundation
import SwiftUI

struct Category: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var image_url: String

    
}
