//
//  CustomDialog.swift
//  GiftHub
//
//  Created by 235 on 5/5/24.
//

import SwiftUI

struct CustomDialog: ViewModifier {
    @ObservedObject var presentationManager: DialogPresentation
    func body(content: Content) -> some View {
        ZStack {
            content
            if presentationManager.isPresented {
                Rectangle().foregroundColor(Color.black.opacity(0.3))
                    .edgesIgnoringSafeArea(.all)

                presentationManager.dialogContent
                    .padding(24)
            }
        }
    }
}

//
