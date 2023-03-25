//
//  TextFieldView.swift
//  TaskTestSwiftUI
//
//  Created by Иса on 22.03.2023.
//

import SwiftUI

struct TextFieldView: View {
    
    @Binding var text: String
    let placeholder: String
    
    var body: some View {
        TextField(text: $text) {
            Text(placeholder)
                .foregroundColor(Color(red: 155/255, green: 155/255, blue: 155/255))
                .font(.custom("Arial", size: 13))
        }
        .frame(height: 35)
        .multilineTextAlignment(.center)
        .background(Color(red: 232/255, green: 232/255, blue: 232/255))
        .cornerRadius(40)

    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView(text: .constant(""), placeholder: "Last name")
    }
}
