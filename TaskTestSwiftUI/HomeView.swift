//
//  HomeView.swift
//  TaskTestSwiftUI
//
//  Created by Иса on 22.03.2023.
//

import SwiftUI

struct HomeView: View {
    
    @Binding var user: UserModel
    
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                ScrollView(.horizontal) {
                    HStack(spacing: 20) {
                        ForEach(Array(zip(categoryItemText, categoryItemImageText)), id: \.0) { category in
                            let (text, image) = category
                            CategoryGoodsView(name: text, image: image)
                        }
                    }
                    .padding()
                }
                
                if !user.latest.isEmpty {
                    LatestView(user: $user)
                        .padding()
                }
                            
                if !user.favorites.isEmpty {
                    FlashSaleView(user: $user)
                        .padding()
                }
                
                Spacer()
                
                VStack {
                    Text("Товар")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    ForEach(Array(user.favorites.enumerated()), id: \.0) { (index, _) in
                        HStack {
                            ProductItemView(product: $user.favorites[index])
                        }
                        
                        
                    }
                }
               
            }
        }
        
    }
}

struct HomeView_Prevview: PreviewProvider {

    static var previews: some View {
        HomeView(user: .constant(UserModel(firstname: "", lastname: "", email: "", password: "", favorites: getSelectedProducts(), latest: getSelectedProducts())))
    }
}

