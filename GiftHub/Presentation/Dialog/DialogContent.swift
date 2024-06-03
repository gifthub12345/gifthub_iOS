//
//  DialogContent.swift
//  GiftHub
//
//  Created by 235 on 5/5/24.
//

import SwiftUI

enum DialogContent: View {

    case joinDialog(isPresented: Binding<Bool>, isSucceed: Binding<Bool> ,roomId: Binding<Int>)
    case makeRoomDialog(isPresented: Binding<Bool>, isSucceed: Binding<Bool>,roomId: Binding<Int>)
    case addGiftDialog(image: UIImage, expiratinDate: String,  isPresented: Binding<Bool>)
    @ViewBuilder
    var body: some View {
        switch self {
        case .joinDialog(let isPresented, let isSucceed, let roomId):
            JoinDialogView(isPresented: isPresented, isSucceed: isSucceed, viewmodel: JoinDialogViewModel())
        case .makeRoomDialog(let isPresented, let isSucceed, let roomId):
            MakeRoomDialogView(isPresented: isPresented, isSucceed: isSucceed, viewModel: MakeRoomDialogViewModel())
        case .addGiftDialog(let image, let date, let isPresented):
            AddGiftDialog(image: image, expirationDate: date, isOpen: isPresented)

        }
    }
}
