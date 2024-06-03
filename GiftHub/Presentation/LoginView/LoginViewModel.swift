//
//  LoginViewModal.swift
//  GiftHub
//
//  Created by 235 on 5/21/24.
//

import SwiftUI
import Alamofire

@Observable
final class LoginViewModel {
    var diContainer: DIContainer
    var navigationState: NavigationRoutes? = nil

    init(diContainer: DIContainer) {
        self.diContainer = diContainer
    }
    func postLogin(authCode: String) async throws{
        let data = try await diContainer.networkManager.performLoginRequest(identity: authCode)
        KeychainManager.shared.saveToken(key: "accessToken", token: data.accessToken)
        KeychainManager.shared.saveToken(key: "refreshToken", token: data.refreshToken)
        navigationState = data.roomID == nil ? .noRoomYet : .mainView(roomId: data.roomID!)

    }
}
