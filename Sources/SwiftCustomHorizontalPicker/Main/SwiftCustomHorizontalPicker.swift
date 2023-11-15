// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI
import Observation

@available(iOS 17.0.0, *)
public struct CustomHorizontalPicker: View {
    
    // MARK: - Objects
    var viewModel = ViewModel()
    
    // MARK: - Internal
    @State private var scrollPosition: Double?
    
    // MARK: - Initial info
    @Binding public var value: Double?
    public let minVal: Double
    public let maxVal: Double
    
    // MARK: - Picker
    public var pickerColor: Color = .accentColor
    public var pickerWidth: CGFloat = 3
    
    // MARK: - Stops
    public var stopsColor: Color = .gray.opacity(0.7)
    public var stopsWidth: CGFloat = 3
    public var miniStopsColor: Color = .gray.opacity(0.7)
    public var miniStopsWidth: CGFloat = 2
    
    public var body: some View {
        ZStack {
            GeometryReader { geometry in
                ScrollView(.horizontal) {
                    HStack(spacing: 0) {
                        ForEach(0..<viewModel.calculateMajorStopsCount(), id: \.self) { index in
                            PickerStopView(color: self.stopsColor, width: self.stopsWidth)
                                .frame(width: 20)
                                .offset(x: -10)
                                
                            
                            ForEach(0..<4, id: \.self) { i in
                                PickerMiniStopView(color: self.miniStopsColor, width: self.miniStopsWidth)
                                    .frame(width: 20)
                                    .offset(x: -10)
                            }
                        }
                        
                        PickerStopView(color: self.stopsColor, width: self.stopsWidth)
                            .frame(width: 20)
                            .offset(x: -10)
                        
                        Rectangle()
                            .fill(.clear)
                            .frame(width: geometry.size.width - 20, height: geometry.size.height)
                    }
                    .scrollTargetLayout()
                    .offset(x: geometry.size.width / 2)
                }
                .scrollIndicators(.hidden)
                .scrollTargetBehavior(.viewAligned)
                .scrollPosition(id: $value)
                .onAppear {
                    viewModel.minVal = minVal
                    viewModel.maxVal = maxVal
                }
            }
        }
        .overlay {
            PickerSelectorView(color: pickerColor, width: pickerWidth)
        }
    }
}

@available(iOS 17.0.0, *)
#Preview {
    CustomHorizontalPicker(value: .constant(20), minVal: 0, maxVal: 100)
        .frame(height: 40)
}
