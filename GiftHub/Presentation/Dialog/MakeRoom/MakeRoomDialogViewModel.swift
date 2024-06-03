//
//  MakeRoomDialogViewModel.swift
//  GiftHub
//
//  Created by 235 on 5/12/24.
//

import Foundation
import Alamofire

class MakeRoomDialogViewModel: ObservableObject {
    @Published var isSucceed: Bool = false
    @Published var roomCode: String = ""
    @Published var joinCodeString: String = ""
    
    func makeRoom() {

        AF.request(APICase.requestCreateRoom(roomTitle: joinCodeString))
            .response {res in
                debugPrint(res)

            }
            .responseDecodable(of: MakeRoomResponse.self) { res in
                switch res.result {
                case .success(let data):
                    self.isSucceed = true
                    self.roomCode = data.code
                    KeychainManager.shared.saveToken(key: "roomCode", token: data.code)
                    KeychainManager.shared.saveToken(key: "roomId", token: String(data.room_id))
                case .failure(let err):
                    print(err)
                }

            }
    }
}
