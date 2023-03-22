//
//  LatestView.swift
//  TaskTestSwiftUI
//
//  Created by Иса on 22.03.2023.
//

import SwiftUI

struct LatestView: View {

    @Binding var user: UserModel

    var body: some View {
        VStack(alignment: .leading) {

            HStack {
                Text("Latest")
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
                    ForEach(Array(user.latest.enumerated()), id: \.0) { (index, value) in
                        let product = Product(name: value.name, price: Double(value.price), image: "image1")
                        LatestItemView(product: .constant(product))
                            .frame(width: UIScreen.main.bounds.width / 3 - 20, height: 150)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                    }
                }

            }
        }
    }
}

struct LatestView_Preview: PreviewProvider {
    static var previews: some View {
        LatestView(user: .constant(UserModel(firstname: "", lastname: "", email: "", password: "", favorites: [], latest: getSelectedProducts())))
    }
}

