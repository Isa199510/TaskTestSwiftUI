//
//  HomeView.swift
//  TaskTestSwiftUI
//
//  Created by Иса on 22.03.2023.
//

import SwiftUI

struct HomeView: View {
    
    @Binding var user: UserModel
    @Binding var products: [Product]

    @State var flashSaleProducts = flashSaleItems
    @State var latestProducts = latestItems
    
    var body: some View {
        NavigationView {
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
                    
//                    if !user.latest.isEmpty {
//                        LatestView(user: $user)
//                            .padding()
//                    }
                    if !latestProducts.isEmpty {
                        LatestView(user: $user, latestProducts: $latestProducts)
                            .padding()
                    }
                                
                    if  !flashSaleProducts.isEmpty {
                        FlashSaleView(user: $user, products: $flashSaleProducts)
                            .padding()
                    }
                    
                    Spacer()
                    
                    VStack {
                        HStack {
                            Text("Goods")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            Spacer()
                        }
                        ForEach(Array(products.enumerated()), id: \.0) { (index, _) in
                            HStack {
                                ProductItemView(product: $products[index], user: $user)
                                    .frame(width: UIScreen.main.bounds.width - 30, height: UIScreen.main.bounds.width - 50)
                                    .cornerRadius(20)
                            }
                            .padding(.vertical)
                            
                        
                        }
                    }
                    .padding()
                   
                }
            }
            .navigationTitle("Trade ba data")
            .navigationBarItems(trailing: UserView(image: user.image ?? Image("person.fill")))
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

struct HomeView_Prevview: PreviewProvider {

    static var previews: some View {
        HomeView(user: .constant(UserModel(firstname: "", lastname: "", email: "", password: "")), products: .constant([
            Product(name: "iPhone 7s", price: 30000, image: "iPhone7"),
            Product(name: "iPhone 10 Pro", price: 40000, image: "iPhone10Pro"),
            Product(name: "iPhone 11 Pro", price: 50000, image: "iPhone11Pro")
        ]))
    }
}

struct UserView: View {
    let image: Image
    var body: some View {
        VStack {
            image
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
        }
    }
}

