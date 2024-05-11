//
//  MakeRoomDialogViewModel.swift
//  GiftHub
//
//  Created by 235 on 5/12/24.
//

import Foundation
class MakeRoomDialogViewModel: ObservableObject {
    @Published var isSucceed: Bool = false
    @Published var roomCode: String = "14732891479819"
    @Published var joinCodeString: String = ""

    func makeRoom() {
        isSucceed = true
    }
}
