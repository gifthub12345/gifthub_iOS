//
//  GetImageResponse.swift
//  GiftHub
//
//  Created by 235 on 6/3/24.
//

import Foundation
struct GetImageResponse: Decodable {
    var url: [ImageUrl]
}
struct ImageUrl: Decodable {
    var url: String

}
