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
    
    var body: some View {
        VStack {
            
            switch selected {
            case 0:
                HomeView(user: $user)
                //            case 1:
                //
            case 1:
                SelectedProductsView(user: $user)
            case 4:
                ProfileView(user: $user)
            default:
                CartView()
            }
            
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
    static var previews: some View {
        TabBarView(user: .constant(userManager.currentUser ?? UserModel(firstname: "Isa", lastname: "Arbuhov", email: "", password: "", cart: getSelectedProducts(), favorites: [], latest: getSelectedProducts())))
    }
}


struct LargeTabBarIcon: ViewModifier {
    func body(content: Content) -> some View {
        content
            .imageScale(.large)
            .frame(width: 30, height: 30)
    }
}

extension View {
    func largeTabBarIcon() -> some View {
        self.modifier(LargeTabBarIcon())
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

