//
//  LastView.swift
//  BaseProject
//
//  Created by 정영준 on 2023/07/25.
//

import SwiftUI

struct LastView: View {
    @Binding var shouldPopToRoot: Bool
    @Binding var isAnotherShow: Bool
    var body: some View {
        VStack {
            CapsuleButton(action: {
                self.isAnotherShow = true
            }, text: "Show Another", textColor: .white, textSize: 18, height: 30, backgroundColor: .black)
            .padding(.horizontal, 16)
            CapsuleButton(action: {
                self.shouldPopToRoot = false
            }, text: "Pop to Root", textColor: .white, textSize: 18, height: 30, backgroundColor: .blue)
            .padding(.horizontal, 16)
        }
        .navigationTitle("Last View")
    }
}

struct LastView_Previews: PreviewProvider {
    static var previews: some View {
        LastView(shouldPopToRoot: .constant(false), isAnotherShow: .constant(false))
    }
}
