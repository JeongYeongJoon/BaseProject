//
//  View+Font.swift
//  BaseProject
//
//  Created by 정영준 on 2023/07/25.
//

import SwiftUI

extension View {
    public func size16Regular() -> some View {
        self.font(.custom("FontName-Regular", size: 16))
    }
    
    public func size16Medium() -> some View {
        self.font(.custom("FontName-Medium", size: 16))
    }
    
    public func size16Bold() -> some View {
        self.font(.custom("FontName-Bold", size: 16))
    }
    
    public func sizeCustom(_ size: CGFloat, weight: Font.Weight = .regular) -> some View {
        switch weight {
        case .regular:
            return self.font(.custom("FontName-Regular", size: size))
        case .medium:
            return self.font(.custom("FontName-Medium", size: size))
        case .bold:
            return self.font(.custom("FontName-Bold", size: size))
        default:
            return self.font(.custom("FontName-Regular", size: size))
        }
    }
}
