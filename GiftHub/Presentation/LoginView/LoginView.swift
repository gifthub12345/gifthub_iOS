import SwiftUI
import Alamofire

struct LoginView: View {
    @State private var navigationPath = NavigationPath()
    @State private var showWebView = false

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

                Button(action: {
                    showWebView = true
                }) {
                    Image("signApple")
                        .resizable()
                        .frame(width: 350, height: 62)
                }
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

                .sheet(isPresented: $showWebView) {
                    WebView(url: URL(string: "https://api.gifthub.site/login/apple")!) { code in

                            KeychainManager.shared.saveToken(key: "Authorization", token: code.authorization)
                        print(code.authorization)
                        showWebView = false
                        navigationPath.append(NavigationRoutes.noRoomYet)
                    }
                    .presentationDetents([
                        .fraction(0.5)])

                
            }
        }
    }


#Preview {
    LoginView()
}
