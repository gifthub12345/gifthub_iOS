//
//  LoginView.swift
//  GiftHub
//
//  Created by 235 on 5/5/24.
//

import SwiftUI
import AuthenticationServices


struct LoginView: View {
    @State private var navigationPath = NavigationPath()
    var body: some View {
        NavigationStack(path: $navigationPath) {
            VStack {
                Text("GIFTHUB")
                    .font(.system(size: 32, weight: .black))
                Image("giftHubLogo")
                    .resizable()
                    .frame(width: 260,height: 260)
                    .padding(.horizontal, 64)
                    .padding(.vertical,40)
                SignInWithAppleButton { request in
                    request.requestedScopes = [.email, .fullName]
                } onCompletion: { result in
                    switch result {
                    case .success(let authresult ):
                        print(authresult.credential)
                        navigationPath.append(NavigationRoutes.noRoomYet)
                    case .failure(let fail):
                        print(fail)
                    }
                }.frame(width: 344, height: 61)
                //                .clipShape(.rect(cornerRadius: <#T##CGFloat#>))

            }
            .navigationDestination(for: NavigationRoutes.self) { routes in
                switch routes {
                case .noRoomYet:
                    NoEnterView(path: $navigationPath)
                case .mainView:
                    CategoryView(path: $navigationPath)
                case .detailView(let detail):
                    CategoryDetailView(category: detail)
                case .setting:
                    SettingView()
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
