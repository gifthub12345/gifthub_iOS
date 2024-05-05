//
//  DialogContent.swift
//  GiftHub
//
//  Created by 235 on 5/5/24.
//

import SwiftUI

enum DialogContent: View {

    case joinDialog(isPresented: Binding<Bool>)
    case makeRoomDialog(isPresented: Binding<Bool>)

    @ViewBuilder
    var body: some View {
        switch self {
        case .joinDialog(let isPresented):
            JoinDialogView(isPresented: isPresented)
        case .makeRoomDialog(let isPresented):
            MakeRoomDialogView(isPresented: isPresented)

        }
    }
}
