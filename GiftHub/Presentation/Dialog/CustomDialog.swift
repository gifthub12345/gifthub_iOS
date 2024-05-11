//
//  CustomDialog.swift
//  GiftHub
//
//  Created by 235 on 5/5/24.
//

import SwiftUI

struct CustomDialog: ViewModifier {
    var presentationManager: DialogPresentation
    func body(content: Content) -> some View {
        ZStack {
            content
            if presentationManager.isPresented {
                Rectangle().foregroundColor(Color.black.opacity(0.3))
                    .edgesIgnoringSafeArea(.all)

                presentationManager.dialogContent
                    .edgesIgnoringSafeArea(.all)
                    .padding(.horizontal, 16)
//                    .padding(24)
            }
        }/*.ignoresSafeArea(.all)*/
    }
}

//
