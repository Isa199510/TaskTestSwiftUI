//
//  Models.swift
//  TaskTestSwiftUI
//
//  Created by Иса on 22.03.2023.
//

import Foundation
import SwiftUI

// Модель Пользователя
struct UserModel: Codable {
    let id: String
    let firstname: String
    let lastname: String
    let email: String
    var password: String
    var image: Image = Image(systemName: "person.fill")
    var cart: [Product] = [Product]()
    var favorites: [Product] = [Product]()
    var latest: [Product] = [Product]()
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstname
        case lastname
        case email
        case password
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(String.self, forKey: .id)
        firstname = try values.decode(String.self, forKey: .firstname)
        lastname = try values.decode(String.self, forKey: .lastname)
        email = try values.decode(String.self, forKey: .email)
        password = try values.decode(String.self, forKey: .password)
        image = Image(systemName: "person.fill")
        cart = [Product]()
        favorites = [Product]()
        latest = [Product]()
        
    }
    
    func isProductInFavorites(product: Product) -> Bool {
        favorites.contains(where: {$0.name == product.name})
    }
    
    func isProductInCarts(product: Product) -> Bool {
        cart.contains(where: {$0.id == product.id})
    }
    
    static func == (lhs: UserModel, rhs: UserModel) -> Bool {
        return lhs.id == rhs.id && lhs.email == rhs.email
    }
    
    init(firstname: String, lastname: String, email: String, password: String) {
        self.id = UUID().uuidString
        self.firstname = firstname
        self.lastname = lastname
        self.email = email
        self.password = password
        image = Image(systemName: "person.fill")
        cart = [Product]()
        favorites = [Product]()
        latest = [Product]()
    }
}

// Модель товара
struct Product {
    let id = UUID()
    let name: String
    let price: Double
    let image: String
    var isFavorited: Bool = false
    
    mutating func isFavoritedToogle() {
        isFavorited.toggle()
    }
    
    func isProducts(product: Product) -> Bool {
        self.id == product.id ? true : false
    }
}

class User: ObservableObject {
    @Published var user: UserModel
    @Published var cart: [Product] = [Product]()
    @Published var favorites: [Product] = [Product]()
    
    init(user: UserModel) {
        self.user = user
        cart = [Product]()
        favorites = [Product]()
    }
}



