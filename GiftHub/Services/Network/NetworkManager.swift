//
//  APIRedirect.swift
//  GiftHub
//
//  Created by 235 on 5/22/24.
//

import Alamofire
import SwiftUI
@Observable
final class NetworkManager {
    func performLoginRequest(identity: String) async throws -> LoginResponse {
        return try await withCheckedThrowingContinuation { continuation in
            AF.request(APICase.requestLogin(authCode: identity))
                .response { res in
                    debugPrint(res)
                }
                .responseDecodable(of: LoginResponse.self) { res in
                    switch res.result {
                    case .success(let response):
                        continuation.resume(returning: response)
                    case .failure(let error):
                        continuation.resume(throwing: error)
                    }
                }
        }
    }
}
