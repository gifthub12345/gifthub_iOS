//
//  GiftHubApp.swift
//  GiftHub
//
//  Created by 235 on 5/5/24.
//

import SwiftUI

@main
struct GiftHubApp: App {
    @State var container = DIContainer()
    var body: some Scene {
        WindowGroup {
            LoginView(viewmodel: LoginViewModel(diContainer: container))
                .environment(container)
        }
    }
}
