//
//  CustomButtonView.swift
//  TaskTestSwiftUI
//
//  Created by Иса on 22.03.2023.
//

import SwiftUI

struct CustomButtonView: View {
    
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .foregroundColor(Color(red: 1, green: 1, blue: 100))
                .background(Color(red: 78/255, green: 85/255, blue: 215/255))
                .cornerRadius(15)
                .background(RoundedRectangle(cornerRadius: 15).stroke(Color(red: 78/255, green: 85/255, blue: 215/255)))
                .fontWeight(.bold)
                
        }
        
    }
}

struct CustomButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CustomButtonView(title: "Sig in") {
            print("Yes")
        }
    }
}
