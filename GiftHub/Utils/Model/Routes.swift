//
//  Routes.swift
//  GiftHub
//
//  Created by 235 on 5/11/24.
//

import Foundation
enum NavigationRoutes: Hashable {
    case noRoomYet
    case mainView(roomId: Int)
    case detailView(detail: Category, roomId: Int)
    case setting
    
}
