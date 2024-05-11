//
//  DialogPresentation.swift
//  GiftHub
//
//  Created by 235 on 5/5/24.
//

import SwiftUI
@Observable
final class DialogPresentation {
     var isPresented = false
     var dialogContent: DialogContent?
     var isSucceed = false
    func show(content: DialogContent?) {
        if let presentDilaog = content {
            dialogContent = presentDilaog
            isPresented = true
        } else {
            isPresented = false
        }
    }
}
