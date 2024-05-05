//
//  LoginView.swift
//  GiftHub
//
//  Created by 235 on 5/5/24.
//

import SwiftUI


struct LoginView: View {
    var body: some View {
        VStack {
            Text("GIFTHUB")
                .font(.system(size: 32, weight: .black))
            Image("giftHubLogo")
                .resizable()
                .frame(width: 260,height: 260)
                .padding(.horizontal, 64)
                .padding(.vertical,40)

        }
    }
}

#Preview {
    LoginView()
}
