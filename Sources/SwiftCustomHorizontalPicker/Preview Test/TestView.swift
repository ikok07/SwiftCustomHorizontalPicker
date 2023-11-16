//
//  TestView.swift
//
//
//  Created by Kaloyan Petkov on 15.11.23.
//

import SwiftUI

@available(iOS 17.0.0, *)
struct TestView: View {
    
    @State private var value: Int?
    
    var body: some View {
        VStack {
            Text("\(value ?? 0)")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom)
            
            CustomHorizontalPicker(value: $value, minVal: 0, maxVal: 100, startValueOffset: 50)
                .frame(height: 40)
        }
    }
}

@available(iOS 17.0.0, *)
#Preview {
    TestView()
}
