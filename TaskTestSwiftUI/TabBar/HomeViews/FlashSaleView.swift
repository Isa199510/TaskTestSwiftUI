//
//  FlashSaleView.swift
//  TaskTestSwiftUI
//
//  Created by Иса on 22.03.2023.
//

import SwiftUI

struct FlashSaleView: View {
    
    @Binding var user: UserModel
    @Binding var products: [Product]
    
    var body: some View {
        VStack {
            HStack {
                
                Text("Flash sale")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
                
                Button(action: {}) {
                    Text("View all")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
                
            }
            .padding(.trailing)
            ScrollView(.horizontal) {
                HStack(spacing: 20) {
                    ForEach(Array(products.enumerated()), id: \.0) { index, value in
                        if !products.isEmpty {
                            ProductItemView(product: $products[index], user: $user)
                                .frame(width: UIScreen.main.bounds.width / 2 - 20, height: 250)
                                .cornerRadius(10)

                        }
                    }
                }
            }
        }
    }
}

struct FlashSaleView_Previews: PreviewProvider {
    static var previews: some View {
        FlashSaleView(user: .constant(UserModel(firstname: "", lastname: "", email: "", password: "")), products: .constant(flashSaleItems))
            .padding()
    }
}
