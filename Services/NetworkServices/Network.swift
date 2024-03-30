//
//  Network.swift
//  Services
//
//  Created by Olga Mogloeva on 29.03.2024.
//

import Foundation

protocol INetwork {
    func fetchData<T: Decodable>(from url: URL, completion: @escaping (Result<T, ServicesError>) -> Void)
}

final class Network: INetwork {
    
    func fetchData<T: Decodable>(from url: URL, completion: @escaping (Result<T, ServicesError>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(.genericError(error)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.noDataError))
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(.decodingFailed))
            }
        }.resume()
    }
}

enum ServicesError: Error {
    case noDataError
    case decodingFailed
    case genericError(Error)
    case customError(String)
}

extension ServicesError: LocalizedError {
    
    var errorDescription: String? {
        switch self {
        case .noDataError:
            "Failed to recieve some data from network request"
        case .decodingFailed:
            "Failed to decode model"
        case .customError(let description):
            description
        case .genericError(let error):
            error.localizedDescription
        }
    }
}
