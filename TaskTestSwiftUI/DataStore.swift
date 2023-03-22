//
//  DataStore.swift
//  TaskTestSwiftUI
//
//  Created by Иса on 22.03.2023.
//

import SwiftUI
import Foundation

func getSelectedProducts() -> [Product] {
    [
        Product(name: "iPhone 5s", price: 25000, image: "image1"),
        Product(name: "iPhone 6s", price: 30000, image: ""),
        Product(name: "iPhone X", price: 40000, image: ""),
        Product(name: "iPhone 11 Pro", price: 50000, image: ""),
        Product(name: "iPhone 14 Pro", price: 80000, image: "")
    ]
}

var userManager = UserManager()
var selectedProducts: [Product] = getSelectedProducts()
var selectGoods: [Product] = [Product]()

let categoryItemText = ["Phones", "Headphones", "Games", "Cars", "Furniture", "Kids"]
let categoryItemImageText = ["iphone", "headphones", "gamecontroller", "car", "sofa", "theatermask.and.paintbrush"]

