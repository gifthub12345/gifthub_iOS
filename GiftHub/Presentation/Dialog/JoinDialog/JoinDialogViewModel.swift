//
//  JoinDialogViewModel.swift
//  GiftHub
//
//  Created by 235 on 5/12/24.
//

import Foundation
import Alamofire
class JoinDialogViewModel: ObservableObject {
    @Published var isSucceed: Bool = false
    @Published var joinCodeString: String = ""
    @Published var roomId: Int = 0
    func joinRoom() {
        AF.request(APICase.requestEnterRoom(roomCode: joinCodeString))
            .responseDecodable(of: Int.self){ res in
                switch res.result {
                case .success(let roomId):
                    self.roomId = roomId
                    self.isSucceed = true
                case .failure(let err):
                    print(err)
                }
            }
    }
}
