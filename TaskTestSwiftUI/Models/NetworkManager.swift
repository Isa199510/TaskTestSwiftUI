//
//  NetworkManager.swift
//  TaskTestSwiftUI
//
//  Created by Иса on 22.03.2023.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

class NetworkManager {
    static let shared = NetworkManager()
    private init () {}
    
    func fetchLatestList(with url: String, completion: @escaping(Result<[Latest], NetworkError>) -> Void) {
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
                    completion(.success(json.latest))
                }
            } catch  {
                completion(.failure(.decodingError))
            }
            
        }.resume()
    }
    
    func fetchFlashSaleList(with url: String, completion: @escaping(Result<[FlashSale], NetworkError>) -> Void) {
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
                let json = try JSONDecoder().decode(FlashSaleAPI.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(json.flash_sale))
                }
            } catch  {
                completion(.failure(.decodingError))
            }
            
        }.resume()
    }
}
