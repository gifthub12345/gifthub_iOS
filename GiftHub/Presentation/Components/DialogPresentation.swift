//
//  DialogPresentation.swift
//  GiftHub
//
//  Created by 235 on 5/5/24.
//

import SwiftUI

final class DialogPresentation: ObservableObject {
    @Published var isPresented = false
    @Published var dialogContent: DialogContent?
    func show(content: DialogContent?) {
        if let presentDilaog = content {
            dialogContent = presentDilaog
            isPresented = true
        } else {
            isPresented = false
        }
    }
}
