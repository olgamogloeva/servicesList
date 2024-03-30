//
//  ServiceViewModel.swift
//  Services
//
//  Created by Olga Mogloeva on 29.03.2024.
//

import UIKit
import Observation

@Observable
final class ServiceViewModel {
    var lists: [ServiceModel] = []
    var isLoading = false
    var alertModel: AlertModel?
    private let modelFactory: IServiceModelFactory
    private let networkService: IServiceNetworkService
    
    // MARK: - Init
    
    init(
        modelFactory: IServiceModelFactory,
        networkService: IServiceNetworkService) {
        self.networkService = networkService
        self.modelFactory = modelFactory
    }
    
    // MARK: - Methods
    
    func onAppear() {
        fetchData()
    }

    func didTapCell(with model: ServiceModel) {
        guard let urlToOpen = URL(string: model.siteURLString),
              UIApplication.shared.canOpenURL(urlToOpen)
        else { return showAlert(from: .customError("Failed to create url")) }
        
        UIApplication.shared.open(urlToOpen)
    }
   
    // MARK: - Private
    
    private func fetchData() {
        if lists.isEmpty {
            isLoading = true
            lists = modelFactory.fakeModelsForLoadingState()
        }
        networkService.getServices { [weak self] result in
            DispatchQueue.main.async {
                guard let self else { return }
                switch result {
                case .success(let success):
                    let sda = self.modelFactory.makeSeviceModel(from: success)
                    self.lists = sda
                    self.isLoading = false
                case .failure(let error):
                    self.showAlert(from: error)
                }
            }
        }
    }
    
    private func showAlert(from error: ServicesError) {
        self.alertModel = self.modelFactory.makeErrorAlertModel(from: error)
    }
}
