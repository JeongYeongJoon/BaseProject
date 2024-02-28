//
//  CapsuleButton.swift
//  BaseProject
//
//  Created by 정영준 on 2023/07/25.
//

import SwiftUI

import SwiftUI

struct CapsuleButton: View {
    let action: () -> Void
    let text: String
    let textColor: Color
    let textSize: CGFloat
    let height: CGFloat
    let backgroundColor: Color
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 0) {
                Spacer()
                Text(text)
                    .font(.system(size: textSize))
                    .foregroundColor(textColor)
                Spacer()
            }
        }
        .frame(height: height)
        .background(backgroundColor)
        .cornerRadius(16)
    }
}
