//
//  LoginResponse.swift
//  GiftHub
//
//  Created by 235 on 6/2/24.
//

import Foundation
struct LoginResponse: Decodable {
    let accessToken: String
    let refreshToken: String
    let roomID: Int?
    let providerAccessToken: String
    enum CodingKeys: String, CodingKey {
        case accessToken
        case refreshToken
        case roomID = "room_id"
        case providerAccessToken = "providerAccessToken"
    }
}
