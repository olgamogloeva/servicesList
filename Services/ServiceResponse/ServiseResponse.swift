//
//  ServiseResponse.swift
//  Services
//
//  Created by Olga Mogloeva on 29.03.2024.
//

import Foundation

struct ServiceResponse: Decodable {

    struct BodyModel: Decodable {
        let services: [ServiceModel]
    }

    struct ServiceModel: Decodable {
        let name: String
        let description: String
        let siteURLString: String
        let iconURLString: String
        
        enum CodingKeys: String, CodingKey {
            case name
            case description
            case siteURLString = "link"
            case iconURLString = "icon_url"
        }
    }
    
    let body: BodyModel
    let status: Int
}

