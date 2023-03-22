//
//  NetworkManager.swift
//  TaskTestSwiftUI
//
//  Created by Иса on 22.03.2023.
//

import Foundation
import SwiftUI

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

class NetworkManager {
    static let shared = NetworkManager()
    private init () {}
    
    func fetchLatestList(
        with url: String,
        completion: @escaping(Result<[Latest], NetworkError>) -> Void) {
            guard let url = URL(string: url) else {
                completion(.failure(.invalidURL))
                return
            }
            
            URLSession.shared.dataTask(with: url) { (data, _, error) in
                guard let data = data else {
                    completion(.failure(.noData))
                    return
                }
                do {
                    let json = try JSONDecoder().decode(LatestAPI.self, from: data)
                    DispatchQueue.main.async {
                        print(json)
                        completion(.success(json.latest))
                    }
                } catch  {
                    completion(.failure(.decodingError))
                }
                
            }.resume()
        }
}
