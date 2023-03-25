//
//  ProductItemView.swift
//  TaskTestSwiftUI
//
//  Created by Иса on 22.03.2023.
//

import SwiftUI

struct ProductItemView: View {
    
    @Binding var product: Product
    @Binding var user: UserModel
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottom) {
                Image(product.image)
                    .resizable()
                    .scaledToFit()
                VStack {
                    Spacer()
                    
                    HStack {
                        Spacer()
                        Button(action: {
                            if !user.favorites.contains(where: {$0.id == product.id}) {
                                user.favorites.insert(product, at: 0)
                                print(user.favorites)
                            } else {
                                guard let index = user.favorites.firstIndex(where: {$0.id == product.id}) else { return }
                                user.favorites.remove(at: index)
                            }
                            product.isFavoritedToogle()
                            
                        }) {
                            
                            Image(systemName: user.isProductInFavorites(product: product) ? "heart.fill" : "heart")
                                .frame(width: geometry.size.width / 22, height: geometry.size.width / 22)
                                .padding(10)
                                .foregroundColor(user.isProductInFavorites(product: product) ? .red : .black)
                                .background(Color.gray)
                                .cornerRadius(geometry.size.width / 22 * 2)
                        }
                        
                        Button(action: {
                            
                            
                            //action for button
//                            NetworkManager.shared.fetchLatestList(with: URLs.urlLatest.rawValue) { results in
//                                print(results, type(of: results))
//                                switch results {
//                                case .success(let latest):
//                                    print(latest)
//                                    //
//                                case .failure(_): break
//                                    //
//                                }
//                            }
                            
                        }) {
                            Image(systemName: "plus")
                                .frame(width: geometry.size.width / 20, height: geometry.size.width / 20)
                                .padding(13)
                                .foregroundColor(.black)
                                .background(Color.gray)
                                .clipShape(
                                    RoundedRectangle(cornerRadius: geometry.size.width / 20 * 2)
                                )
                        }
                    }
                    .offset(x: -10, y: -15)
                }
            }
        }
    }
}



struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductItemView(product: .constant(Product(name: "Name goods", price: 12000, image: "image1")), user: .constant(UserModel(firstname: "", lastname: "", email: "", password: "")))
    }
}


func isFavorited(_ product: Product) -> Bool {
    if (selectGoods.firstIndex(where: { $0.id == product.id }) != nil) {
        return true
    }
    return false
}

