//
//  SwiftUIView.swift
//  
//
//  Created by Kaloyan Petkov on 18.01.24.
//

import SwiftUI

final class Test: ObservableObject {
    @Published var test: Int? = 95
}

struct SwiftUIView: View {
    @StateObject private var viewModel = Test()
    
    var body: some View {
        TestView(value: $viewModel.test)
    }
}

#Preview {
    SwiftUIView()
}
