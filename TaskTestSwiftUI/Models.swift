//
//  Models.swift
//  TaskTestSwiftUI
//
//  Created by Иса on 22.03.2023.
//

import Foundation

protocol UserManagerProtocol {
    var currentUser: UserModel? { get }
//    func registerUser(firstname: String, lastname: String, email: String, password: String)
    func registerUser(user: UserModel)
//    func loginUser(email: String, password: String)
    func addProductToFavorites(product: Product)
    func removeProductFromFavorites(product: Product)
//    func addProductToCart(product: Product)
//    func removeProductFromCart(product: Product)
    func isProduct(product: Product) -> Bool
}

// Модель Пользователя
struct UserModel {
    let id = UUID()
    let firstname: String
    let lastname: String
    let email: String
    var password: String
    var cart: [Product] = [Product]()
    var favorites: [Product] = [Product]()
    var latest: [Product] = [Product]()
}

// Модель товара
struct Product {
    let id = UUID()
    let name: String
    let price: Double
    let image: String
    var isFavorited: Bool = false
    
    mutating func isFavoritedToogle() {
        isFavorited.toggle()
    }
    
    func isProducts(product: Product) -> Bool {
        self.id == product.id ? true : false
    }
}

class UserManager: UserManagerProtocol {
    
    
//    static let shared = UserManager()
    
//    private init() {}
    
    private var users: [UserModel] = []
    private var currentUserIndex: Int?
    
    var currentUser: UserModel? {
        if let index = currentUserIndex { return users[index] }
        return nil
    }
    
//    func registerUser(firstname: String, lastname: String, email: String, password: String) {
//        let user = UserModel(firstname: firstname, lastname: lastname, email: email, password: password, cart: nil, favorites: nil)
//        currentUserIndex = users.count
//        users.append(user)
//    }
    
    func registerUser(user: UserModel) {
        currentUserIndex = users.count
        users.append(user)
    }
    
    func isProduct(product: Product) -> Bool {
        guard let index = currentUserIndex else { return false}
        
        if users[index].favorites.contains(where: {$0.id == product.id}) {
            return true
        }
        return false
    }
    
    func addProductToFavorites(product: Product) {
        guard let index = currentUserIndex else { return }
        
        if !isProduct(product: product) {
            users[index].favorites.append(product)
        }
    }
    
    func removeProductFromFavorites(product: Product) {
        guard let index = currentUserIndex else { return }
        if isProduct(product: product) {
            guard let indexFav = users[index].favorites.firstIndex(where: {$0.id == product.id}) else { return }
            users[index].favorites.remove(at: indexFav)
        }
    }
    
    // Добавление товара в избранное
//    func addProductToFavorites(product: Product) {
//
//        guard let index = currentUserIndex else { return }
//        guard let favorites = users[index].favorites else { return }
//
//        if !favorites.isProducts(product) {
//            users[index].favorites?.addProduct(product)
//        }
//    }
    
//    func removeProductFromFavorites(product: Product) {
//        guard let index = currentUserIndex else { return }
//        users[index].favorites?.removeProduct(product)
//    }
    
//    func addProductToCart(product: Product) {
//        guard let index = currentUserIndex else { return }
//        guard let cart = users[index].cart else { return }
//
//        if !cart.isProducts(product) {
//            users[index].cart?.addProduct(product)
//        }
//    }
//
//    func removeProductFromCart(product: Product) {
//        guard let index = currentUserIndex else { return }
//        users[index].cart?.removeProduct(product)
//    }
}

// Модель Корзины
class Cart {
    var products: [Product] = []
    
    func addProduct(_ product: Product) {
        products.append(product)
    }
    
    func removeProduct(_ product: Product) {
        if let index = products.firstIndex(where: { $0.id == product.id }) {
            products.remove(at: index)
        }
    }
    
    func isProducts(_ product: Product) -> Bool {
        if (products.firstIndex(where: { $0.id == product.id }) != nil) {
            return true
        }
        return false
    }
}

class User {
    var user: UserModel
    var cart: [Cart] = [Cart]()
    var favorites: [Cart] = [Cart]()
    
    init(user: UserModel, cart: [Cart], favorites: [Cart]) {
        self.user = user
        self.cart = cart
        self.favorites = favorites
    }
    
    init(user: UserModel) {
        self.user = user
        cart = [Cart]()
        favorites = [Cart]()
    }
}


// Координатор
class AppCoordinator: ObservableObject {
    @Published var isLoggedIn = false
    @Published var selectedTab: Tab = .home
    @Published var showProductDetails: Bool = false
    @Published var selectedProduct: Product?
    
    enum Tab {
        case home
        case favorites
        case cart
        case profile
    }
    
    func start() {
        if let _ = UserSession.shared.user {
            self.isLoggedIn = true
        }
    }
    
    func logout() {
        UserSession.shared.logout()
        self.isLoggedIn = false
    }
}


// Менеджер сессии
class UserSession {
    static let shared = UserSession()
    
    private init() {}
    
    var user: User?
    
//    func isLoginSucces(_ user: User) -> Bool {
//        if self.user?.id == user.id {
//            return true
//        }
//        return false
//    }
    
    func login(_ user: User) -> Bool {
        // Реализация метода проверки правильности введенных данных

//        if isLoginSuccess() {
//            user = User(id: 1, name: "John", email: email)
//            return true
//        } else {
//            return false
//        }
        return true
    }
    
    func logout() {
        user = nil
    }
}


// ViewModel для экрана "Home"
class HomeViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var searchText: String = ""
    
    func fetchProducts() {
        // Здесь реализация запроса к API для получения списка товаров
        // и сохранение его в массиве products
        // ...
    }
}

// ViewModel для экрана "Favorites"
class FavoritesViewModel: ObservableObject {
    @Published var favorites = Cart()
    
    func addProductToFavorites(_ product: Product) {
        favorites.addProduct(product)
    }
    
    func removeProductFromFavorites(_ product: Product) {
        favorites.removeProduct(product)
    }
}

// Проверка на валидность почты
extension String {
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
}












//protocol AddUserViewModelProtocol {
//    var username: String { get set }
//    var email: String { get set }
//    var password: String { get set }
//    var confirmPassword: String { get set }
//
//    func createUser(completion: @escaping (Result<Void, Error>) -> Void)
//}
//
//class AddUserViewModel: AddUserViewModelProtocol {
//    var username: String = ""
//    var email: String = ""
//    var password: String = ""
//    var confirmPassword: String = ""
//
//    private let userManager: UserManagerProtocol
//
//    init(userManager: UserManagerProtocol = UserManager.shared) {
//        self.userManager = userManager
//    }
//
//    func createUser(completion: @escaping (Result<Void, Error>) -> Void) {
//        // Validate user input
//        guard !username.isEmpty else {
//            completion(.failure(UserError.emptyUsername))
//            return
//        }
//
//        guard email.isValidEmail() else {
//            completion(.failure(UserError.invalidEmail))
//            return
//        }
//
//        guard !password.isEmpty else {
//            completion(.failure(UserError.emptyPassword))
//            return
//        }
//
//        guard password == confirmPassword else {
//            completion(.failure(UserError.passwordsDoNotMatch))
//            return
//        }
//
//        // Create user
//        let user = User(username: username, email: email, password: password)
//        userManager.createUser(user: user) { result in
//            switch result {
//            case .success:
//                completion(.success(()))
//            case .failure(let error):
//                completion(.failure(error))
//            }
//        }
//    }
//}
