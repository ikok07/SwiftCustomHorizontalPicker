//
//  PickerMiniStopView.swift
//  
//
//  Created by Kaloyan Petkov on 15.11.23.
//

import SwiftUI

@available(iOS 17.0.0, *)
public struct PickerMiniStopView: View {
    public let color: Color
    public let width: CGFloat
    
    public var body: some View {
        GeometryReader { geometry in
            Rectangle()
                .fill(color)
                .frame(width: width, height: geometry.size.height / 2)
                .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
        }
    }
}

@available(iOS 17.0.0, *)
#Preview {
    VStack {
        PickerMiniStopView(color: .gray.opacity(0.7), width: 2)
            .frame(height: 40)
            .overlay {
                Rectangle()
                    .stroke(.gray, lineWidth: 1)
            }
    }
    .padding(.horizontal)
}
