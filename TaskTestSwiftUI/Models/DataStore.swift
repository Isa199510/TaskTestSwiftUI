//
//  DataStore.swift
//  TaskTestSwiftUI
//
//  Created by Иса on 22.03.2023.
//

import SwiftUI
import Foundation

var users: [UserModel] = [
    UserModel(firstname: "Arbuhov", lastname: "Isa", email: "Isa.arbuhov@mail.ru", password: "")

]

func getSelectedProducts() -> [Product] {
    [
        Product(name: "iPhone 5s", price: 25000, image: "iPhone5s"),
        Product(name: "iPhone 6s", price: 30000, image: ""),
        Product(name: "iPhone X", price: 40000, image: ""),
        Product(name: "iPhone 11 Pro", price: 50000, image: ""),
        Product(name: "iPhone 14 Pro", price: 80000, image: "")
    ]
}

var userP = UserModel(firstname: "", lastname: "", email: "", password: "")
var PRODUCTS = [
    Product(name: "iPhone 7s", price: 30000, image: "iPhone7"),
    Product(name: "iPhone 10 Pro", price: 40000, image: "iPhone10Pro"),
    Product(name: "iPhone 11 Pro", price: 50000, image: "iPhone11Pro"),
    Product(name: "iPhone 14 Pro", price: 80000, image: "iPhone7")
]

var flashSaleItems = [
    Product(name: "iPhone 7s", price: 30000, image: "iPhone7"),
    Product(name: "iPhone 10 Pro", price: 40000, image: "iPhone10Pro"),
    Product(name: "iPhone 11 Pro", price: 50000, image: "iPhone11Pro")
]

var latestItems = [Product]()


var selectedProducts: [Product] = getSelectedProducts()
var selectGoods: [Product] = [Product]()

let categoryItemText = ["Phones", "Headphones", "Games", "Cars", "Furniture", "Kids"]
let categoryItemImageText = ["iphone", "headphones", "gamecontroller", "car", "sofa", "theatermask.and.paintbrush"]

