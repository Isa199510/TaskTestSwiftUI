//
//  ProfileVIew.swift
//  TaskTestSwiftUI
//
//  Created by Иса on 22.03.2023.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var isShowingImagePicker = false
    @State private var selectedImage: Image? = Image("avatar")
    @Binding var user: UserModel
    
    @State private var isLogOut = false
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                VStack {
                    
                    //Photo Stack
                    VStack{
                        
//                        selectedImage?
                        user.image?
                            .resizable()
                            .frame(width: 70, height: 70)
                            .scaledToFit()
                            .clipShape(Circle())
                            .foregroundColor(.gray)
                        
                        Button(action: {
                            isShowingImagePicker = true
                            print(user.image)
                        }) {
                            Text("Change photo")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                    }
                    .sheet(isPresented: $isShowingImagePicker) {
                        ImagePicker { image in
//                            selectedImage = Image(uiImage: image)
                            user.image = Image(uiImage: image)
                            isShowingImagePicker = false
                        }
                    }
                    
                    Text("\(user.firstname) \(user.lastname)")
                        .fontWeight(.bold)
                        .padding(.top, 10)
                        .padding(.bottom, 30)
                    
                    Button(action: {}) {
                        ZStack {
                            Image(systemName: "square.and.arrow.up")
                                .fontWeight(.bold)
                                .font(.system(size: 15))
                                .offset(x: -100)
                            Spacer()
                            Text("Upload item")
                                
                        }
                        .frame(height: 40)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(Color(red: 1, green: 1, blue: 100))
                        .background(Color(red: 78/255, green: 85/255, blue: 215/255))
                        .cornerRadius(15)
                        .background(RoundedRectangle(cornerRadius: 40).stroke(Color(red: 78/255, green: 85/255, blue: 215/255)))
    //                    .fontWeight(.bold)
                    }
                    .padding(.horizontal, 30)
                    
                    CustomViewProfile(imageLeft: "note", text: "Trade store", imageRight: "chevron.right", textRight: nil)
                    CustomViewProfile(imageLeft: "note", text: "Payment method", imageRight: "chevron.right", textRight: nil)
                    CustomViewProfile(imageLeft: "note", text: "Balance", imageRight: nil, textRight: "$1593")
                    CustomViewProfile(imageLeft: "note", text: "Trade history", imageRight: "chevron.right", textRight: nil)
                    CustomViewProfile(imageLeft: "arrow.triangle.2.circlepath", text: "Restore purchase", imageRight: "chevron.right", textRight: nil)
                    CustomViewProfile(imageLeft: "questionmark.circle", text: "Help", imageRight: nil, textRight: nil)
                    Button(action: {
                        isLogOut.toggle()
                        print(user)
                    }) {
                        CustomViewProfile(imageLeft: "arrow.forward.to.line", text: "Log out", imageRight: nil, textRight: nil)
                    }
                    .foregroundColor(.black)
//                    .fullScreenCover(isPresented: $isLogOut) {
//
//                        SignInPageView()
//                    }
                    
                    
                }
                .navigationTitle("Profile")
                .navigationBarTitleDisplayMode(.inline)
            }
            
        }
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: .constant(UserModel(firstname: "Isa", lastname: "Arbuhov", email: "", password: "")))
    }
}

struct CustomViewProfile: View {
    let imageLeft: String
    let text: String
    let imageRight: String?
    let textRight: String?
    
    var body: some View {
        HStack {
            Image(systemName: imageLeft)
                .padding(10)
                .frame(width: 40, height: 40)
                .scaledToFit()
                .background(Color("ButtonBackground"))
                .clipShape(Circle())
            Text(text)
            Spacer()
            if imageRight != nil {
                Image(systemName: imageRight ?? "")
                    .fontWeight(.bold)
            } else {
                Text(textRight ?? "")
            }
        }
        .padding(.horizontal, 30)
        .padding(.vertical, 5)
    }
}


struct ImagePicker: UIViewControllerRepresentable {
    typealias UIViewControllerType = UIImagePickerController
    typealias CompletionHandler = (UIImage) -> Void
    
    private let completionHandler: CompletionHandler
    
    init(completionHandler: @escaping CompletionHandler) {
        self.completionHandler = completionHandler
    }
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(completionHandler: completionHandler)
    }
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        private let completionHandler: CompletionHandler
        
        init(completionHandler: @escaping CompletionHandler) {
            self.completionHandler = completionHandler
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                completionHandler(image)
            }
        }
    }
}
