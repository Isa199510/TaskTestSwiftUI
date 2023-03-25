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
    
    @State var user = UserModel(firstname: "", lastname: "", email: "", password: "")
    @State var products = PRODUCTS
    
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
                    if logIn.isValidEmail() {
                        if let dict = UserDefaults.standard.dictionary(forKey: "user") {
                            let userFirstname = dict["firstname"] as? String ?? ""
                            let userLastname = dict["lastname"] as? String ?? ""
                            let userEmail = dict["email"] as? String ?? ""
                            let userPassword = dict["password"] as? String ?? ""
                            let userImage = dict["image"] as? Image ?? Image(systemName: "person.fill")
                            
                            if logIn == userEmail && password == userPassword {
                                user = UserModel(firstname: userFirstname, lastname: userLastname, email: userEmail, password: userPassword)
                                showTabBar.toggle()
                            } else {
                                print("Error")
                            }
                            
                        }
                    } else {
                        print("no valid")
                    }
                }
                .padding(.horizontal, 40)
                .padding(.top, 50)
                .fullScreenCover(isPresented: $showTabBar) {
                    TabBarView(user: $user, products: $products)
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

