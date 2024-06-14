//
//  GetImageResponse.swift
//  GiftHub
//
//  Created by 235 on 6/3/24.
//

import Foundation
struct GetImageResponse: Decodable, Identifiable {
    var url: String
    var id: Int
}

//struct ImageUrl: Decodable {
//    var url: String
//}
