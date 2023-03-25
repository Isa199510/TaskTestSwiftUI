//
//  UserSettings.swift
//  TaskTestSwiftUI
//
//  Created by Иса on 24.03.2023.
//

import Foundation
import Combine

class UserSettings {
    static let shared = UserSettings()
    
    private let defaults = UserDefaults.standard
    
    // Key for your saved data
    private let usersKey = "users"
    
    // MARK: - Public methods
    
    var users: [UserModel] {
        get {
            guard let data = defaults.object(forKey: usersKey) as? Data else {
                return []
            }
            do {
                let users = try JSONDecoder().decode([UserModel].self, from: data)
                return users
            } catch {
                print("Error decoding users: \(error.localizedDescription)")
                return []
            }
        }
        set {
            do {
                let data = try JSONEncoder().encode(newValue)
                defaults.set(data, forKey: usersKey)
            } catch {
                print("Error encoding users: \(error.localizedDescription)")
            }
        }
    }
    
    // MARK: - Private init to make it a singleton
    
    private init() { }
}
