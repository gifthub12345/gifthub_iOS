//
//  MainViewModel.swift
//  GiftHub
//
//  Created by 235 on 6/14/24.
//

import Alamofire
import Combine

class MainViewModel: ObservableObject {
    @Published var roomTitle: String = ""
    func getTitle(roomId: Int) {
        AF.request(APICase.requestMainRoom(roomid: roomId))
     
            .responseDecodable(of: RoomTitleResponse.self) { res in
                self.roomTitle = res.value!.title
            }
    }
}
