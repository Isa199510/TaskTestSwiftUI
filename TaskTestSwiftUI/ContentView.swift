//
//  ContentView.swift
//  TaskTestSwiftUI
//
//  Created by Иса on 22.03.2023.
//

import SwiftUI



struct ContentView: View {
    @State var user = userP
//    @State var user = UserModel(firstname: "", lastname: "", email: "", password: "", cart: getSelectedProducts())
    @State var products: [Product] = PRODUCTS

    var body: some View {
        NavigationView {
            SignInPageView()
//            TabBarView(user: $user, products: $products)
//            LatestVIew2()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
