import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let url: URL
    var onDataReceived: ((AuthResponse) -> Void)?
    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: WebView

        init(parent: WebView) {
            self.parent = parent
        }

        func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
//            if let url = navigationAction.request.url, url.absoluteString.contains("https://api.gifthub.site/login/apple") {
//                // Extract authorization code from URL
//                if let code = url.queryParameters?["code"] {
//                    parent.onCodeReceived?(code)
//                }
//                decisionHandler(.cancel)
//                return
//            }
            decisionHandler(.allow)
        }
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            webView.evaluateJavaScript("document.body.innerText") { (result, error) in
                           if let result = result as? String {
                               self.parseAndSendData(result)
                           }
                       }
              }
        private func parseAndSendData(_ dataString: String) {
                guard let data = dataString.data(using: .utf8) else { return }
                do {
                    let authResponse = try JSONDecoder().decode(AuthResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.parent.onDataReceived?(authResponse)
                    }
                } catch {
                    print("Failed to parse JSON: \(error.localizedDescription)")
                }
            }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        webView.load(URLRequest(url: url))
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        // No need to update the view
    }
}

private extension URL {
    var queryParameters: [String: String]? {
        guard let components = URLComponents(url: self, resolvingAgainstBaseURL: true),
              let queryItems = components.queryItems else { return nil }
        return queryItems.reduce(into: [String: String]()) { (result, item) in
            result[item.name] = item.value
        }
    }
}
