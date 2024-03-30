//
//  ServiceScreenAssembly.swift
//  Services
//
//  Created by Olga Mogloeva on 30.03.2024.
//

import SwiftUI

enum ServiceScreenAssembly {
    static func assemly() -> some View {
        let viewModel = ServiceViewModel(
            modelFactory: ServiceModelFactory(),
            networkService: ServiceNetworkService(network: Network())
        )
        let view = ServicesList(viewModel: viewModel)
        return view
    }
}
