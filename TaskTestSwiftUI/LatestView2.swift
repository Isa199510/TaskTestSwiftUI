//
//  LatestView2.swift
//  TaskTestSwiftUI
//
//  Created by Иса on 22.03.2023.
//

import SwiftUI

struct LatestVIew2: View {
    
    @State var latests: [Latest] = [Latest]()
    
    var body: some View {
        VStack {
            Button(action: {
                NetworkManager.shared.fetchLatestList(with: URLs.urlLatest.rawValue) { results in
                    switch results {
                    case .success(let latests):
                        self.latests = latests
                    case .failure(let error):
                        print(error)
                    }
                }
            }) {
                Text("Tapped")
                    .frame(width: 100, height: 40)
            }
            
            ForEach(Array(latests.enumerated()), id: \.0) { (index, value) in
//                let product = Product(name: value.name, price: Double(value.price), image: "")
                
//                ProductItemView(product: .constant(product))
                Text(value.name)
                AsyncImage(
                    url: URL(string: value.image_url),
                    transaction: Transaction(animation: .easeInOut)
                ) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .transition(.scale(scale: 0.1, anchor: .center))
                    case .failure:
                        Image(systemName: "wifi.slash")
                    @unknown default:
                        EmptyView()
                    }
                }
                .frame(width: 100, height: 100)
                .background(Color.gray)
//                .clipShape(Circle())
//                Image(uiImage: UIImage(data: imagesData[index] ?? Data()) ?? UIImage())
            }
     

        }
        
    }
}

struct LatestVIew2_Previews: PreviewProvider {
    static var previews: some View {
        LatestVIew2()
    }
}

//extension Image {
//    func data(url:URL) -> Self {
//        do {
//            DispatchQueue.main.async {
//                if let data = try? Data(contentsOf: url) {
//                    return Image(uiImage: UIImage(data: data)!).resizable()
//            }
//
//        }
//
//        } catch {
//            return self
//        }
//        return self
//            .resizable()
//    }
//}

