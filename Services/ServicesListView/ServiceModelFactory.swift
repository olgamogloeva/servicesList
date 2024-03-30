//
//  File.swift
//  Services
//
//  Created by Olga Mogloeva on 29.03.2024.
//

private extension String {
    static let fakeShortText = "TetsCell"
    static let fakeLongText = String(repeating: .fakeShortText, count: 7)
    static let errorTitle = "Title"
    static let smthWrong = "Smth went wrong"
    static let okButtonTitle = "Ok"
}

protocol IServiceModelFactory {
    func makeSeviceModel(from model: ServiceResponse) -> [ServiceModel]
    func fakeModelsForLoadingState() -> [ServiceModel]
    func makeErrorAlertModel(from error: ServicesError) -> AlertModel
}

final class ServiceModelFactory { }
    
// MARK: - IServiceModelFactory

extension ServiceModelFactory: IServiceModelFactory {
    func makeSeviceModel(from model: ServiceResponse) -> [ServiceModel] {
        model.body.services.compactMap { model in
            return ServiceModel(
                name: model.name,
                description: model.description,
                siteURLString: model.siteURLString,
                iconURLString: model.iconURLString
            )
        }
    }
    
    func fakeModelsForLoadingState() -> [ServiceModel] {
        [fakeModel(), fakeModel(), fakeModel(), fakeModel()]
    }
    
    func makeErrorAlertModel(from error: ServicesError) -> AlertModel {
        AlertModel(
            title: .errorTitle,
            message: error.errorDescription ?? .smthWrong,
            buttonTitle: .okButtonTitle
        )
    }
}

// MARK: - Private

private extension ServiceModelFactory {
    func fakeModel() -> ServiceModel {
        .init(name: .fakeShortText,
              description: .fakeLongText,
              siteURLString: .fakeShortText,
              iconURLString: .fakeShortText
        )
    }
    
}
