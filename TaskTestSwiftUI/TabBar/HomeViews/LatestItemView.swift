//
//  LatestItemView.swift
//  TaskTestSwiftUI
//
//  Created by Иса on 23.03.2023.
//

import SwiftUI

struct LatestItemView: View {
    
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
                    .offset(x: -(geometry.size.width / 5), y: -(geometry.size.height / 5))
                    .font(.system(size: geometry.size.width / 10))
                    .foregroundColor(.accentColor)

                Text(product.price.formatted() + "р")
                    .offset(x: -(geometry.size.width / 5), y: -(geometry.size.height / 15))
                    .font(.system(size: geometry.size.width / 15))
                    .foregroundColor(.accentColor)


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


struct LatestItemView_Previews: PreviewProvider {
    static var prod = Product(name: "Samsung", price: 12000, image: "https://avatars.mds.yandex.net/get-mpic/6251774/img_id4273297770790914968.jpeg/orig")
    static var previews: some View {
        LatestItemView(product: .constant(prod))
    }
}
