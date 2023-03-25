//
//  PasswordFieldView.swift
//  TaskTestSwiftUI
//
//  Created by Иса on 22.03.2023.
//

import SwiftUI

struct PasswordFieldView: View {
    @Binding var password: String
    @State private var isSecure = true
    
    var body: some View {
        ZStack(alignment: .trailing) {
            if isSecure {
                SecureField("Password", text: $password)
                    .foregroundColor(Color(red: 155/255, green: 155/255, blue: 155/255))
                    .font(.custom("Arial", size: 13))
            } else {
                TextField("Password", text: $password)
                    .foregroundColor(Color(red: 155/255, green: 155/255, blue: 155/255))
                    .font(.custom("Arial", size: 13))
            }
            Button(action: { isSecure.toggle() }) {
                Image(systemName: isSecure ? "eye.slash" : "eye")
                    .foregroundColor(.gray)
            }
            .offset(x: -16)
        }
        .frame(height: 35)
        .multilineTextAlignment(.center)
        .background(Color(red: 232/255, green: 232/255, blue: 232/255))
        .cornerRadius(40)
        
    }
}


struct PasswordField_Previews: PreviewProvider {
    static var previews: some View {
        PasswordFieldView(password: .constant("gregewwr"))
    }
}

