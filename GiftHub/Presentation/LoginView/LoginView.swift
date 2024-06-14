import SwiftUI
import Alamofire
import AuthenticationServices
struct LoginView: View {
    @State private var navigationPath = NavigationPath()
    @State private var showWebView = false
    var viewmodel: LoginViewModel
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
                    request.requestedScopes = [.email]
                } onCompletion: { result in
                    switch result {
                    case .success(let authresults):
                        switch authresults.credential {
                        case let appleIDCredential as ASAuthorizationAppleIDCredential:
                            
                            let authorization = String(data: appleIDCredential.authorizationCode!, encoding:  .utf8)
                            
                            guard let authorizationCode = authorization else { return }
                            Task {
                                try await viewmodel.postLogin(authCode: authorizationCode)
                            }
                            
                            //                            viewModel.setAuthorizationCode(authorizationCode)
                            //                            viewModel.postA/*uthorCode()*/
                        default:
                            break
                        }
                    case .failure(let err):
                        print(err.localizedDescription)
                    }
                }.frame(width: 350, height: 64).clipShape(.rect(cornerRadius: 10))
            }
            .navigationDestination(for: NavigationRoutes.self) { routes in
                switch routes {
                case .noRoomYet:
                    NoEnterView(path: $navigationPath)
                case .mainView(let roomId):
                    CategoryView(path: $navigationPath, roomId: roomId)
                case .detailView(let detail, let roomId):
                    CategoryDetailView(viewModel: CategoryViewModel(roomid: roomId), category: detail)
                case .setting:
                    SettingView(path: $navigationPath)
                }
            }
        }     .onChange(of: viewmodel.navigationState) { newState in
            if let newState = newState {
                navigationPath.append(newState)
            }
        }
    }
}
//
//#Preview {
//    LoginView()
//}
