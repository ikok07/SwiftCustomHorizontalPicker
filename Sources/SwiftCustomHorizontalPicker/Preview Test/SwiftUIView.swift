//
//  SwiftUIView.swift
//  
//
//  Created by Kaloyan Petkov on 18.01.24.
//

import SwiftUI


struct SwiftUIView: View {
    @State private var value: Int? = 20
    
    var body: some View {
        VStack {
            Text("\(value! * 10)")
            TestView(value: $value)
        }
    }
}

#Preview {
    SwiftUIView()
}
