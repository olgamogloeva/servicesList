//
//  ServiceModel.swift
//  Services
//
//  Created by Olga Mogloeva on 29.03.2024.
//

import Foundation

struct ServiceModel: Identifiable {
    var id: String = UUID().uuidString
    let name: String
    let description: String
    let siteURLString: String
    let iconURLString: String
}
