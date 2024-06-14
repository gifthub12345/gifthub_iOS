//
//  API.swift
//  GiftHub
//
//  Created by 235 on 5/21/24.
//

import Foundation
import Alamofire
struct API {
    static let baseURL = "https://api.gifthub.site"
    enum NetworkHeaderKey: String {
        case contentType = "Content-Type"
        case authorization = "Authorization"
    }
    static let applicationJSON = "application/json"
    static var headerWithoutToken: HTTPHeaders {
          return [
            NetworkHeaderKey.contentType.rawValue : applicationJSON
          ]
      }
    static var headerWithmultiPart: HTTPHeaders = [
        NetworkHeaderKey.contentType.rawValue: "multipart/form-data",
        NetworkHeaderKey.authorization.rawValue: "\(KeychainManager.shared.readToken(key: "accessToken") ?? "")"
    ]
    static var headerwithAuthorization: HTTPHeaders =  [
        NetworkHeaderKey.contentType.rawValue: API.applicationJSON,
        NetworkHeaderKey.authorization.rawValue: "\(KeychainManager.shared.readToken(key: "accessToken") ?? "")"
    ]
}
