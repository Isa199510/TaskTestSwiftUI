//
//  SignInPageView.swift
//  TaskTestSwiftUI
//
//  Created by Иса on 22.03.2023.
//

import SwiftUI

struct SignInPageView: View {
        
    @State private var isSecure = true
    
    @State private var showLogIn = false
    @State private var showPasswordConfirmation = false
    
    @State private var firstNameText = ""
    @State private var lastNameText = ""
    @State private var email = ""
    
    @State var user = UserModel(firstname: "", lastname: "", email: "", password: "")
    
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                
                Text("Sign in")
                    .fontWeight(.bold)
                    .font(.title)
                    .padding(.bottom, 70)
                
                VStack(spacing: 30) {
                    TextFieldView(text: $firstNameText, placeholder: "First name")
                    TextFieldView(text: $lastNameText, placeholder: "Last name")
                    TextFieldView(text: $email, placeholder: "Email")
                    
                    Button(action: {
                        if firstNameText.count >= 3 && lastNameText.count >= 3 && email.isValidEmail() {
                            print(UserSettings.shared.users)
                            
                            // получаем сохраненные данные из UserDefaults
//                            let defaults = UserDefaults.standard
//                            var savedUsers = [UserModel]()
//                            if let data = defaults.data(forKey: "users") {
//                                let decoder = JSONDecoder()
//                                savedUsers = try! decoder.decode([UserModel].self, from: data)
//                            }

                            // сохраняем только новые структуры
//                            for savedUser in savedUsers {
//                                if savedUsers.contains(where: { userModel in
//                                    userModel.id == savedUser.id
//                                }) {
//                                    savedUsers.append(savedUser)
//                                }
//
//                            }

                            // сохраняем обновленные данные в UserDefaults
//                            let encoder = JSONEncoder()
//                            let data = try! encoder.encode(savedUsers)
//                            defaults.set(data, forKey: "users")
                            
                            // здесь остановился
                            
//                            if let dict = UserDefaults.standard.dictionary(forKey: "user") {
//                                let firstname = dict["firstname"] as? String ?? ""
//                                let lastname = dict["lastname"] as? String ?? ""
//                                let email = dict["email"] as? String ?? ""
//                                print(firstname, lastname, email)
//                                if email != user.email {
//                                    print("email equal")
//                                    user = UserModel(firstname: firstNameText, lastname: lastNameText, email: email, password: "")
//                                    showPasswordConfirmation.toggle()
//                                }
//                            }
                        }
                        
                    }) {
                        Text("Sign in")
                            .frame(height: 50)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(Color(red: 1, green: 1, blue: 100))
                            .background(Color(red: 78/255, green: 85/255, blue: 215/255))
                            .cornerRadius(15)
                            .background(RoundedRectangle(cornerRadius: 40).stroke(Color(red: 78/255, green: 85/255, blue: 215/255)))
                            .fontWeight(.bold)
                    }
                    .fullScreenCover(isPresented: $showPasswordConfirmation) {
                        PasswordConfirmationView(user: $user)
                    }
                }
                .padding(.horizontal, 30)
                
                HStack {
                    Text("Already have an account?")
                        .foregroundColor(Color(red: 155/255, green: 155/255, blue: 155/255))
                    
                    Button(action: { showLogIn.toggle() }) {
                        Text("Log in")
                    }
                    .fullScreenCover(isPresented: $showLogIn) {
                        LogInView()
                    }
                    
                    Spacer()
                    
                }
                .padding(.horizontal, 30)
                .padding(.bottom, 30)
                .font(.caption)
                
                VStack(alignment: .leading, spacing: 40) {
                    Button {
                        //action
                    } label: {
                        Image("googleIcon")
                        Text("Sign in with Google")
                    }
                    
                    Button {
                        // action
                    } label: {
                        Image("appleIcon")
                        Text("Sign in with Apple")
                    }
                }
                .foregroundColor(.black)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 250/255, green: 249/255, blue: 255/255))
            .edgesIgnoringSafeArea(.all)
        }
        
    }
}

struct SignInPageView_Previews: PreviewProvider {
    static var previews: some View {
        SignInPageView()
            .background(Color(red: 255/255, green: 0, blue: 0))
            .edgesIgnoringSafeArea(.all)
            .navigationTitle("Sing in")
    }
}


