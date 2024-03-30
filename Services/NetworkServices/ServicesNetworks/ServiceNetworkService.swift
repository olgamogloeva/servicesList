//
//  File.swift
//  Services
//
//  Created by Olga Mogloeva on 29.03.2024.
//

import Foundation

private extension String {
    static let urlPath = "https://publicstorage.hb.bizmrg.com/sirius/result.json"
}

protocol IServiceNetworkService {
    func getServices(completion: @escaping (Result<ServiceResponse, ServicesError>) -> Void)
}

final class ServiceNetworkService {
    let network: INetwork
    
    // MARK: - Init
    
    init(network: INetwork) {
        self.network = network
    }
}

// MARK: - IServiceNetworkService

extension ServiceNetworkService: IServiceNetworkService {
    func getServices(completion: @escaping (Result<ServiceResponse, ServicesError>) -> Void) {
        guard let url = URL(string: .urlPath) else {
            return completion(.failure(ServicesError.customError("Failed to create url")))
        }
        network.fetchData(
            from: url,
            completion: completion
        )
    }
}
