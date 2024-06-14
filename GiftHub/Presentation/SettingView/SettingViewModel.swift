//
//  SettingViewModel.swift
//  GiftHub
//
//  Created by 235 on 6/14/24.
//

import UIKit
import Alamofire

class SettingViewModel: ObservableObject {
    func deleteUser(completion: @escaping (Bool) -> Void) {
        AF.request(APICase.requestDeleteMember)
            .response {
                data in debugPrint(data)
            }
            .validate()
            .response { response in
                switch response.result {
                case .success:
                    completion(true)
                case .failure:
                    completion(false)
                }
            }

    }
}
