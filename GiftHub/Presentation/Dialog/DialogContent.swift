//
//  DialogContent.swift
//  GiftHub
//
//  Created by 235 on 5/5/24.
//

import SwiftUI

enum DialogContent: View {

    case joinDialog(isPresented: Binding<Bool>, isSucceed: Binding<Bool>)
    case makeRoomDialog(isPresented: Binding<Bool>, isSucceed: Binding<Bool>)
    case addGiftDialog(image: UIImage, expiratinDate: String,  isPresented: Binding<Bool>)
    @ViewBuilder
    var body: some View {
        switch self {
        case .joinDialog(let isPresented, let isSucceed):
            JoinDialogView(isPresented: isPresented, isSucceed: isSucceed)
        case .makeRoomDialog(let isPresented, let isSucceed):
            MakeRoomDialogView(isPresented: isPresented, isSucceed: isSucceed)
        case .addGiftDialog(let image, let date, let isPresented):
            AddGiftDialog(image: image, expirationDate: date, isOpen: isPresented)

        }
    }
}
