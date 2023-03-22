//
//  ModelAPI.swift
//  TaskTestSwiftUI
//
//  Created by Иса on 22.03.2023.
//

import Foundation

enum URLs: String {
    case urlLatest = "https://run.mocky.io/v3/cc0071a1-f06e-48fa-9e90-b1c2a61eaca7"
    case urlFlashSale = "https://run.mocky.io/v3/a9ceeb6e-416d-4352-bde6-2203416576ac"
}

struct LatestAPI: Codable {
    let latest: [Latest]
}

struct Latest: Codable {
    let category: String
    let name: String
    let price: Int
    let image_url: String
}

struct FlashSaleAPI {
    let flash_sale: [FlashSale]
}

struct FlashSale {
    
}
