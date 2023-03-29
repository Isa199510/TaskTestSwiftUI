//
//  LoginView.swift
//  TaskTestSwiftUI
//
//  Created by Иса on 22.03.2023.
//

import SwiftUI

struct LogInView: View {
    
    @State private var logIn = ""
    @State private var password = ""
    @State private var showTabBar = false
    
    @State private var user = UserModel(firstname: "", lastname: "", email: "", password: "")
    @State private var products = PRODUCTS
    
    @State private var textError = ""
    @State private var showTextError = false
    
    var body: some View {
        
        NavigationView {
            VStack {
                Text("Welcome back")
                    .fontWeight(.bold)
                    .font(.title)
                    .padding(.top, 100)
                
                Spacer()
                
                VStack(spacing: 40) {
                    TextFieldView(text: $logIn, placeholder: "Email")
                    PasswordFieldView(password: $password)
                    
                }
                .padding(.horizontal, 40)
                
                CustomButtonView(title: "Login") {
                    
                    if logIn.isValidEmail() {
                        if UserSettings.shared.users.contains(where: {$0.email == logIn && $0.password == password}) {
                            guard let indexUser = UserSettings.shared.users.firstIndex(where: {$0.email == logIn && $0.password == password}) else { return }
                            user = UserSettings.shared.users[indexUser]
                            showTabBar.toggle()
                        } else {
                            showTextError = true
                            textError = "login or password entered incorrectly"
                        }
                    } else {
                        showTextError = true
                        textError = "incorrect mail format"
                    }
                }
                .padding(.horizontal, 40)
                .padding(.top, 50)
                .fullScreenCover(isPresented: $showTabBar) {
                    TabBarView(user: $user, products: $products)
                }
                
                Text(textError)
                    .foregroundColor(.red)
                    .font(.caption)
                    .opacity(showTextError ? 1 : 0)
                    .cornerRadius(10)
                
                Spacer(minLength: 200)
                
            }
            .background(Color(red: 250/255, green: 249/255, blue: 255/255))
            .edgesIgnoringSafeArea(.all)
        }
        
    }
        
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}

