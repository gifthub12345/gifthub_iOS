//
//  View+.swift
//  GiftHub
//
//  Created by 235 on 5/5/24.
//

import SwiftUI
extension View {
    func customDialog(
        presentationManager: DialogPresentation
    ) -> some View {
        self.modifier(CustomDialog(presentationManager: presentationManager))
    }
}
