//
//  FlashSaleView.swift
//  TaskTestSwiftUI
//
//  Created by Иса on 22.03.2023.
//

import SwiftUI

struct FlashSaleView: View {
    
    @Binding var user: UserModel
    @Binding var flashSaleProducts: [Product]
    
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
                    ForEach(Array(flashSaleProducts.enumerated()), id: \.0) { index, product in
                        FlashSaleItemView(user: $user, product: .constant(product))
                            .frame(width: UIScreen.main.bounds.width / 2 - 20, height: 250)
                            .cornerRadius(10)
                        
                        
                    }
                }
            }
        }
    }
}

struct FlashSaleView_Previews: PreviewProvider {
    static var previews: some View {
        FlashSaleView(user: .constant(UserModel(firstname: "", lastname: "", email: "", password: "")), flashSaleProducts: .constant(flashSaleItems))
            .padding()
    }
}
