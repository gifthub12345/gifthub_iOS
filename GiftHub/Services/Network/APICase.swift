//
//  APICase.swift
//  GiftHub
//
//  Created by 235 on 5/21/24.
//

import Foundation
import Alamofire
enum APICase {
    case requestLogin(authCode: String)
    case requestCreateRoom(roomTitle: String)
    case requestEnterRoom(roomCode: String)
    case requestExitRoom(roomid: Int)
    case requestMainRoom(roomid: Int)
    case requestRoomCode(roomid: Int)
    case requestRoomMemeber(roomid: Int)
    case requestSaveImage
    case requestCategoryList(roomid: Int, categoryId: Int)
    case requestRemoveImage(roomid: Int, categoryId: Int, giftconId: Int)
    case requestDeleteMember
}

extension APICase: Router, URLRequestConvertible {
    var baseURL: String {
        return API.baseURL
    }
    var path: String {
        switch self {
        case .requestLogin:
            "/login/apple"
        case .requestCreateRoom:
            "/room/create"
        case .requestEnterRoom:
            "/room/enter"
        case .requestExitRoom(let roomid):
            "/room/exit/\(roomid)"
        case .requestMainRoom(let roomid):
            "/room/main/\(roomid)"
        case .requestRoomCode(let roomid):
            "/room/\(roomid)"
        case .requestRoomMemeber(let roomid):
            "/room/\(roomid)/users"
        case .requestSaveImage:
            ""
        case .requestCategoryList(let roomId, let categoryId):
            "/room/\(roomId)/categories/\(categoryId)"
        case .requestRemoveImage(let roomid, let categoryId, let giftconId):
            "/room/\(roomid)/categories/\(categoryId)/\(giftconId)"
        case .requestDeleteMember:
            "/revoke"
        }
    }
    
    var method: Alamofire.HTTPMethod {
        switch self {
        case .requestLogin:
                .post
        case .requestCreateRoom:
                .post
        case .requestEnterRoom:
                .post
        case .requestExitRoom(let roomid):
                .post
        case .requestMainRoom(let roomid):
                .get
        case .requestRoomCode(let roomid):
                .get
        case .requestRoomMemeber(let roomid):
                .get
        case .requestSaveImage:
                .post
        case .requestCategoryList(let roomid, let categoryId):
                .get
        case .requestRemoveImage(let roomid, let categoryId, let giftconId):
                .delete
        case .requestDeleteMember:
                .delete
        }
    }
    
    var headers: Alamofire.HTTPHeaders {
        switch self {
        case .requestLogin:
            return API.headerWithoutToken
        default:
            return API.headerwithAuthorization
        }
    }
    
    var parameters: Encodable? {
        switch self {
        case .requestLogin(let authCode):
            [
                "authCode" : authCode
            ]
        case .requestCreateRoom(let roomTitle):
            [
                "title" : roomTitle
            ]

        case .requestEnterRoom(let roomCode):
            [
                "code" : roomCode
            ]
        case .requestExitRoom(let roomid):
            nil
        case .requestMainRoom(let roomid):
            nil
        case .requestRoomCode(let roomid):
            nil
        case .requestRoomMemeber(let roomid):
            nil
        case .requestSaveImage:
            nil
        case .requestCategoryList:
            nil
        case .requestRemoveImage(let roomid, let categoryId, let giftconId):
            nil
        case .requestDeleteMember:
            nil
        default:
            nil
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = URL(string: baseURL + path)

        var request = URLRequest(url: url!)
        request.method = method
        request.headers = headers
        if let parameters = parameters {
            request = try JSONParameterEncoder().encode(parameters, into: request)
     }
            else {
            request =  try URLEncoding.default.encode(request , with: nil)
        }
        return request
    }

}
