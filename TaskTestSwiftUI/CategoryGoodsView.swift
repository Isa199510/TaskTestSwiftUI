//
//  CategoryGoodsView.swift
//  TaskTestSwiftUI
//
//  Created by Иса on 22.03.2023.
//

import SwiftUI

struct CategoryGoodsView: View {
    
    let name: String
    let image: String
    
    var body: some View {
        Button(action: {}) {
            VStack {
                Image(systemName: image)
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding()
                    .background(Color("ButtonBackground"))
                    .clipShape(Circle())
                Text(name).font(.caption2)
            }
            .foregroundColor(.black)
        }
    }
}

struct CategoryGoodsView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryGoodsView(name: "Phones", image: "iphone")
    }
}

