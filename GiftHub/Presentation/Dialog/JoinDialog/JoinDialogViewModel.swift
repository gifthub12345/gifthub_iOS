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

    func joinRoom() {
        AF.request(APICase.requestEnterRoom(roomCode: joinCodeString))
            .response { res in
                debugPrint(res)
            }
    }
}
