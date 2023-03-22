//
//  SelectedProductsView.swift
//  TaskTestSwiftUI
//
//  Created by Иса on 22.03.2023.
//

import SwiftUI

struct SelectedProductsView: View {
    
//    private var selectedProds = getSelectedProducts()
    @State private var favoritedProducts = selectGoods
    @Binding var user: UserModel
    
    var body: some View {
        ForEach(0..<user.favorites.count) { index in
            Text(user.favorites[index].name)
        }
        
        
        
    }
}

struct SelectedProductsView_Previews: PreviewProvider {
    static var previews: some View {
        SelectedProductsView(user: .constant(UserModel(firstname: "Isa", lastname: "Arbuhov", email: "", password: "", cart: getSelectedProducts(), favorites: [Product(name: "iPhone", price: 12000, image: "iPhone5s")], latest: getSelectedProducts())))
    }
}
