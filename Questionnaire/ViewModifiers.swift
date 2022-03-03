//
//  HorizontalCenter.swift
//  Questionnaire
//
//  Created by Xiao Quan on 3/3/22.
//

import SwiftUI

struct HorizontalCenter: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            
            content
            
            Spacer()
        }
    }
}

struct Bottom: ViewModifier {
    func body(content: Content) -> some View {
        VStack {
            Spacer()
            
            content
        }
    }
}

extension View {
    func horizontalCentered() -> some View {
        modifier(HorizontalCenter())
    }
    
    func bottom() -> some View {
        modifier(Bottom())
    }
}
