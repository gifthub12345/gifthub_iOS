//
//  AddGiftModal.swift
//  GiftHub
//
//  Created by 235 on 5/11/24.
//

import SwiftUI

struct AddGiftDialog: View {
   let image: UIImage
   var expirationDate: String
    @Binding var isOpen: Bool
    var callback: () -> Void
    var body: some View {
            VStack {
                ZStack(alignment: .top) {
                    Image(uiImage: image)
                        .resizable()
                        .frame(width: 160, height: 240)
                        .padding(.bottom, 24)
                    HStack {
                        Spacer()
                        Button(action: {isOpen.toggle()}, label: {
                            Circle()
                                .fill(Color(.secondarySystemBackground))
                                .frame(width: 30, height: 30)
                                .overlay(
                                    Image(systemName: "xmark")
                                        .font(.system(size: 15, weight: .bold, design: .rounded))
                                        .foregroundColor(.secondary)
                                )
                        }).buttonStyle(PlainButtonStyle())
                            .accessibilityLabel("Close")
                            .padding(.trailing, 16)
                    }
                }
                    Text("유효기간: "+expirationDate)
                    .font(.system(size: 20, weight: .semibold))
                    .padding(.bottom, 8)
                Text("이 기프티콘을 등록하시겠습니까?")
                    .foregroundStyle(Color.gray)
                    .font(.system(size: 14, weight: .medium))
                    .padding(.bottom,24)
                Button(action: {callback()
                    isOpen.toggle()}, label: {
                    Text("네 등록할래요!")
                        .foregroundStyle(.black)
                        .frame(maxWidth: .infinity)
                        .frame( height: 44)
                        .background(Color.purple)
                        .clipShape(.rect(cornerRadius: 8))
                }).accessibilityLabel("Add")
                    .padding(.horizontal, 16)
            }
            .padding(.vertical, 16)
            .background(.white)
            .clipShape(.rect(cornerRadius: 20))
            .padding(.horizontal, 32)
            .offset(x: 0, y: -40)


        }


}

//#Preview {
//
//        AddGiftModal(image: UIImage(named: "money")! , expirationDate: "2024년 08월 03일", isOpen: .constant(true))
//
//}
