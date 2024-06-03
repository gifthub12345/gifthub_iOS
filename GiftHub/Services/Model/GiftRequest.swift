//
//  GiftRequest.swift
//  GiftHub
//
//  Created by 235 on 6/3/24.
//

import Foundation
struct GiftRequest: Codable {
    var imageFile: Data
    var imageOcrDTO: ImageOcrDTO
}
struct ImageOcrDTO:Codable {
    var expire: String
    var barcode: String
}
