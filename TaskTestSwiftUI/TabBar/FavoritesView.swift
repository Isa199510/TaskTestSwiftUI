//
//  SelectedProductsView.swift
//  TaskTestSwiftUI
//
//  Created by Иса on 22.03.2023.
//

import SwiftUI

struct FavoritesView: View {
    
    @Binding var user: UserModel
    
    var body: some View {
        List {
            ForEach(Array(user.favorites.enumerated()), id: \.0) { (_, value) in
                HStack {
                    
                    AsyncImage(
                        url: URL(string: value.image),
                        transaction: Transaction(animation: .easeInOut)
                    ) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 70, height: 70)
                                .padding()
                                .transition(.scale(scale: 0.1, anchor: .topLeading))
                        case .failure:
                            Image(systemName: "wifi.slash")
                        @unknown default:
                            EmptyView()
                        }
                    }
                    
                    VStack {
                        Text(value.name)
                            .font(.title2)
                        Text(value.price.formatted() + "р")
                            .font(.title3)
                    }
                    Spacer()
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.black, lineWidth: 1)
                )
            }
            .onDelete(perform: removeItems)
            
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        
        var indexUserRemove: Product?
        user.favorites.indices.forEach { index in
            if offsets.contains(index) {
                indexUserRemove = user.favorites[index]
                user.favorites.remove(at: index)
            }
        }
        
        guard let indexUserFavoritesRemove = indexUserRemove else { return }
        guard let indexProductRemove = PRODUCTS.firstIndex(where: {$0.id == indexUserFavoritesRemove.id}) else { return }
        PRODUCTS[indexProductRemove].isFavoritedToogle()
        
    }
}

struct SelectedProductsView_Previews: PreviewProvider {

    static var previews: some View {
        FavoritesView(user: .constant(UserModel(
            firstname: "Isa",
            lastname: "Arbuhov",
            email: "",
            password: ""
        )))
    }
}
