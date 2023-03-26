//
//  TabBarView.swift
//  TaskTestSwiftUI
//
//  Created by Иса on 22.03.2023.
//

import SwiftUI

struct TabBarView: View {
    
    @State private var selected = 0
    
    @Binding var user: UserModel
    @Binding var products: [Product]
    
    var body: some View {
        VStack {
            
            switch selected {
            case 0: HomeView(user: $user, products: $products)
            case 1: FavoritesView(user: $user)
            case 2: CartView(user: $user)
            case 4: ProfileView(user: $user)
            default: Text("") }
            
            Spacer()
            
            HStack {
                TabBarItemButton(
                    image: "house",
                    background: selected == 0 ? Color("ButtonBackground") : Color.clear,
                    foreground: selected == 0 ? .black: .gray
                ) { selected = 0 }
                
                Spacer()
                
                TabBarItemButton(
                    image: "heart",
                    background: selected == 1 ? Color("ButtonBackground") : Color.clear,
                    foreground: selected == 1 ? .black: .gray
                ) { selected = 1 }
                
                Spacer()
                
                TabBarItemButton(
                    image: "cart",
                    background: selected == 2 ? Color("ButtonBackground") : Color.clear,
                    foreground: selected == 2 ? .black: .gray
                ) { selected = 2 }
                
                Spacer()
                
                TabBarItemButton(
                    image: "bubble.left",
                    background: selected == 3 ? Color("ButtonBackground") : Color.clear,
                    foreground: selected == 3 ? .black: .gray
                ) { selected = 3 }
                
                
                Spacer()
                
                TabBarItemButton(
                    image: "person",
                    background: selected == 4 ? Color("ButtonBackground") : Color.clear,
                    foreground: selected == 4 ? .black: .gray
                ) { selected = 4 }
                
                
            }
            .padding(.horizontal, 30)
            .padding(.top, 20)
            
        }
        
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var products = [
            Product(name: "iPhone 5s", price: 25000, image: "iPhone5s"),
            Product(name: "iPhone 6s", price: 30000, image: ""),
            Product(name: "iPhone X", price: 40000, image: ""),
            Product(name: "iPhone 11 Pro", price: 50000, image: ""),
            Product(name: "iPhone 14 Pro", price: 80000, image: "")
        ]
    
    static var previews: some View {
        TabBarView(user: .constant(UserModel(firstname: "Isa", lastname: "Arbuhov", email: "", password: "")), products: .constant(products))
    }
}

struct TabBarItemButton: View {
    
    let image: String
    let background: Color
    let foreground: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: image)
                .resizable()
                .frame(width: 20, height: 20)
                .padding(10)
                .background(background)
                .clipShape(Circle())
                .foregroundColor(foreground)
            
        }
    }
}

func bgColorForButton(_ with: Int, at: Int) -> Color {
    with == at ? Color("ButtonBackground") : Color.clear
}

func fgColorForButton(_ with: Int, at: Int) -> Color {
    with == at ? Color.black : Color.gray
}

