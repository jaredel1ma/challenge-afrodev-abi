//
//  NetworkService.swift
//  abi-beer-app
//
//  Created by Jarede Lima on 26/11/20.
//

import Foundation

enum BeerError: Error {
    case invalidData
    case unknown(String)
}

protocol NetworkServiceProtocol {
    func requestData(url: URL, completion: @escaping (Result<Data, BeerError>) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    init() { }
    
    func requestData(url: URL, completion: @escaping (Result<Data, BeerError>) -> Void) {
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                completion(.failure(.unknown(error.localizedDescription)))
            }
            
            guard  let validData = data else {
                completion(.failure(.invalidData))
                return
            }
            completion(.success(validData))
        }.resume()
    }
}
