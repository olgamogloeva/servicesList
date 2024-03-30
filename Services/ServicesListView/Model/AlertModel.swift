//
//  AlertModel.swift
//  Services
//
//  Created by Olga Mogloeva on 30.03.2024.
//

import Foundation

struct AlertModel: Identifiable {
    let id = UUID()
    let title: String
    let message: String
    let buttonTitle: String
}
