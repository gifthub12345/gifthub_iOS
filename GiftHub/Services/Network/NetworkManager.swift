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
    private let session  = Session(redirectHandler: Redirector(behavior: .follow))
    func performloginRedirect() {
        let url = "https://api.gifthub.site/login/apple"

                // Configure the session to handle redirects
//                let session = Session(configuration: .default, redirectHandler: RedirectHandler())
//        let session = Session(redirectHandler: Redirector(behavior: .follow))
                session.request(url, method: .get)
            .response {res in
                debugPrint(res)
            }
                    .validate()
                    .response { response in
                        switch response.result {
                        case .success(let data):
                            if let url = URL(string: url) {
                                                   UIApplication.shared.open(url)
                                               }
                        case .failure(let error):
                            print("Request error: \(error.localizedDescription)")
                        }
                    }
    }
}
//class RedirectHandler: RedirectHandler {
//    func task(_ task: URLSessionTask, willBeRedirectedTo request: URLRequest, for response: HTTPURLResponse, completion: @escaping (URLRequest?) -> Void) {
//        print("Redirecting to: \(request.url?.absoluteString ?? "Unknown URL")")
//        completion(request) // Allow the redirection
//    }
//}
