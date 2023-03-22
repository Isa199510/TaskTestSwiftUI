//
//  ProductItemView.swift
//  TaskTestSwiftUI
//
//  Created by Иса on 22.03.2023.
//

import SwiftUI

struct ProductItemView: View {
    
    @Binding var product: Product
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottom) {
                Image("image1")
                    .resizable()
                VStack {
                    Spacer()
                    
                    HStack {
                        Spacer()
                        Button(action: {
                            print(product.isFavorited)
                            product.isFavoritedToogle()
                            if isFavorited(product) {
                                if let index = selectGoods.firstIndex(where: {$0.id == product.id}) {
                                    selectGoods.remove(at: index)
                                }
                            } else {
                                selectGoods.insert(product, at: 0)
                            }
                        }) {
                            
                            Image(systemName: product.isFavorited ? "heart.fill" : "heart")
                                .frame(width: geometry.size.width / 22, height: geometry.size.width / 22)
                                .padding(10)
                                .foregroundColor(product.isFavorited ? .red : .black)
                                .background(Color.gray)
                                .cornerRadius(geometry.size.width / 22 * 2)
                        }
                        
                        Button(action: {
                            //action for button
                            NetworkManager.shared.fetchLatestList(with: URLs.urlLatest.rawValue) { results in
                                print(results, type(of: results))
                                switch results {
                                case .success(let latest):
                                    print(latest)
                                    //
                                case .failure(_): break
                                    //
                                }
                            }
                            
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
        ProductItemView(product: .constant(Product(name: "Name goods", price: 12000, image: "image1")))
    }
}


func isFavorited(_ product: Product) -> Bool {
    if (selectGoods.firstIndex(where: { $0.id == product.id }) != nil) {
        return true
    }
    return false
}

