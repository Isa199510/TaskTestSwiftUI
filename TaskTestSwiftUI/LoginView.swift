//
//  LoginView.swift
//  TaskTestSwiftUI
//
//  Created by Иса on 22.03.2023.
//

import SwiftUI

struct LogInView: View {
    
    let log = "Isa@mail.ru"
    let pass = "123"
    
    @State private var logIn = ""
    @State private var password = ""
    @State private var showTabBar = false
    
    var body: some View {
        
        NavigationView {
            VStack {
                Text("Welcome back")
                    .fontWeight(.bold)
                    .font(.title)
                    .padding(.top, 100)
                
                Spacer()
                
                VStack(spacing: 40) {
                    TextFieldView(text: $logIn, placeholder: "First name")
                    PasswordFieldView(password: $password)
                }
                .padding(.horizontal, 40)
                
                
                CustomButtonView(title: "Login") {
//                    showTabBar.toggle()
                    if logIn.isValidEmail() {
                        if logIn == log && password == pass {
                            print("Welcome")
                        } else {
//                            logIn = ""
                            password = ""
                        }
                    } else {
                        print("no valid")
                    }
                }
                .padding(.horizontal, 40)
                .padding(.top, 50)
                .fullScreenCover(isPresented: $showTabBar) {
                    TabBarView(user: .constant(UserModel(firstname: "Isa", lastname: "", email: "Arbuhov", password: "", cart: getSelectedProducts(), favorites: getSelectedProducts(), latest: getSelectedProducts())))
                }
                
                Spacer(minLength: 200)
                
            }
        }
        
    }
        
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}

