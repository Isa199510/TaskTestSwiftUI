//
//  CartView.swift
//  TaskTestSwiftUI
//
//  Created by Иса on 22.03.2023.
//

import SwiftUI


struct CartView: View {
    
    var body: some View {
        
        HStack {
            
        }
    }
}


struct LatestItemView: View {
    
    @Binding var product: Product
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottom) {
                Image(product.image)
                    .resizable()
                
                VStack {
                    
                    Spacer()
                    Button(action: {
                        print(geometry.size.width, geometry.size.height)
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
}


struct LatestItemView_Previews: PreviewProvider {
    static var previews: some View {
        LatestView(user: .constant(UserModel(firstname: "", lastname: "", email: "", password: "", favorites: getSelectedProducts(), latest: getSelectedProducts())))

    }
}




