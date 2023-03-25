//
//  CartView.swift
//  TaskTestSwiftUI
//
//  Created by Иса on 22.03.2023.
//

import SwiftUI


struct CartView: View {
    
    @Binding var user: UserModel
    
    var body: some View {
        
        VStack(alignment: .leading) {
            ForEach(Array(user.cart.enumerated()), id: \.0) { (_, value) in
                HStack {
                    Image(value.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 70, height: 70)
                        .padding()
                        .clipShape(Circle())
                    
                    VStack {
                        Text(value.name)
                            .font(.title2)
                        Text(value.price.formatted() + "р")
                            .font(.title3)
                    }
                    
                    Spacer()
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.black, lineWidth: 1)
                )
                
            }
            
        }
        .padding()
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(user: .constant(UserModel(firstname: "", lastname: "", email: "", password: "")))
    }
}




