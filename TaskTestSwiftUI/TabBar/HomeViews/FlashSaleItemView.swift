//
//  FlashSaleItemView.swift
//  TaskTestSwiftUI
//
//  Created by Иса on 25.03.2023.
//

import SwiftUI

struct FlashSaleItemView: View {
    
    @Binding var user: UserModel
    @Binding var product: Product
    
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottom) {
                Color.white.ignoresSafeArea(.all)
                AsyncImage(
                    url: URL(string: product.image),
                    transaction: Transaction(animation: .easeInOut)
                ) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit()
                            .transition(.scale(scale: 0.1, anchor: .topLeading))
                    case .failure:
                        Image(systemName: "wifi.slash")
                    @unknown default:
                        EmptyView()
                    }
                }
                
                Text(product.name)
                    .offset(x: -(geometry.size.width / 7), y: -(geometry.size.height / 5))
                    .font(.system(size: geometry.size.width / 10))
                    .foregroundColor(.accentColor)

                Text("$" + product.price.formatted())
                    .offset(x: -(geometry.size.width / 3), y: -(geometry.size.height / 15))
                    .font(.system(size: geometry.size.width / 15))
                    .foregroundColor(.accentColor)

                Button(action: {
                    if !user.favorites.contains(where: {$0.name == product.name}) {
                        user.favorites.insert(product, at: 0)
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
                .offset(x: geometry.size.width / 20, y:  -(geometry.size.height / 15))

                Button(action: {
                    // action for button

                }) {
                    Image(systemName: "plus")
                        .frame(width: geometry.size.height / 5, height: geometry.size.height / 10)
                        .foregroundColor(.black)
                        .padding(5)
                        .background(Color.gray)
                        .clipShape(Circle())
                }
                .offset(x: geometry.size.width / 4, y:  -(geometry.size.height / 20.0))

            }
        }
    }
}

struct FlashSaleItemView_Previews: PreviewProvider {
    static var previews: some View {
        FlashSaleItemView(user: .constant(UserModel(firstname: "", lastname: "", email: "", password: "")), product: .constant(Product(name: "sfada", price: 123, image: "https://newbalance.ru/upload/iblock/697/iz997hht_nb_02_i.jpg")))
    }
}
