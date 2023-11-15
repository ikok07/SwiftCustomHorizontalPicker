//
//  PickerSelectorView.swift
//  
//
//  Created by Kaloyan Petkov on 15.11.23.
//

import SwiftUI

@available(iOS 17.0, *)
struct PickerSelectorView: View {
    
    let color: Color
    let width: CGFloat
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Rectangle()
                    .fill(color)
                    .frame(width: width, height: geometry.size.height / 1.2)
                
                VStack {
                    Triangle()
                        .fill(color)
                        .frame(width: width * 5, height: width * 3)
                        .rotationEffect(.degrees(180))
                        .offset(y: -10)
                    
                    Spacer()
                    
                    Triangle()
                        .fill(color)
                        .frame(width: width * 5, height: width * 3)
                        .offset(y: 10)
                }
            }
            .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
        }
    }
}

@available(iOS 17.0, *)
#Preview {
    PickerSelectorView(color: .accentColor, width: 3)
        .frame(height: 40)
        .padding()
}
