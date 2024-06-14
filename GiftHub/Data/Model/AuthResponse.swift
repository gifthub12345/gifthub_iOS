//
//  AuthResponse.swift
//  GiftHub
//
//  Created by 235 on 5/22/24.
//

import Foundation
struct AuthResponse: Codable {
    let authorization: String
    let providerAccessToken: String

    enum CodingKeys: String, CodingKey {
        case authorization = "Authorization"
        case providerAccessToken = "ProviderAccessToken"
    }
}
