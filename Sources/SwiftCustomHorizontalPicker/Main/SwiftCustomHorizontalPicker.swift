// The Swift Programming Language
// https://docs.swift.org/swift-book


import SwiftUI
import Observation
import SwiftUIIntrospect


/// Notice:
/// The minVal and maxVal should be divided by 5 in order for the picker to work correctly.
@available(iOS 17.0.0, *)
public struct CustomHorizontalPicker: View {
    
    // MARK: - Objects
    var viewModel = ViewModel()
    
    // MARK: - Internal
    @State private var initialised: Bool = false
    @State private var scrolledToStart: Bool = false
    
    @State private var majorStopsCount: Double = 0
    @State private var scrollPosition: Double?
    @State private var initialOffset: Double = 0
    @State private var maxOffset: Double = 0
    
    // MARK: - Initial info
    @Binding public var value: Int?
    public let minVal: Int
    public let maxVal: Int

    public let startValueOffset: Int
    
    // MARK: - Spacing
    public var spacing: CGFloat = 20
    
    // MARK: - Picker
    public var pickerColor: Color = .accentColor
    public var pickerWidth: CGFloat = 3
    
    // MARK: - Stops
    public var stopsColor: Color = .gray.opacity(0.7)
    public var stopsWidth: CGFloat = 3
    public var miniStopsColor: Color = .gray.opacity(0.7)
    public var miniStopsWidth: CGFloat = 2
    
    /// - Example:
    /// If you want to start with number 12
    /// ```swift
    /// CustomHorizontalPicker(value: $value, minVal: 10, maxVal: 100, startValueOffset: 2)
    /// ```
    public init(value: Binding<Int?>, minVal: Int, maxVal: Int, startValueOffset: Int = 0) {
        self._value = value
        self.minVal = minVal
        self.maxVal = maxVal
        self.startValueOffset = startValueOffset
    }
    
    public var body: some View {
        ZStack {
//            Text("\((value ?? 0))")
            GeometryReader { geometry in
                ScrollView(.horizontal) {
                    HStack(spacing: 0) {
                        ForEach(0..<Int(majorStopsCount), id: \.self) { index in
                                    PickerStopView(color: self.stopsColor, width: self.stopsWidth)
                                        .frame(width: self.spacing)
                                        .offset(x: -(self.spacing / 2))
    
    
                                    ForEach(0..<4, id: \.self) { i in
                                        PickerMiniStopView(color: self.miniStopsColor, width: self.miniStopsWidth)
                                            .frame(width: self.spacing)
                                            .offset(x: -(self.spacing / 2))
                                    }
                        }
                        
                        PickerStopView(color: self.stopsColor, width: self.stopsWidth)
                            .frame(width: self.spacing)
                            .offset(x: -(self.spacing / 2))

                        Rectangle()
                            .fill(.clear)
                            .frame(width: geometry.size.width - self.spacing, height: geometry.size.height)
                    }
                    .background(GeometryReader {
                        Color.clear.preference(key: ViewOffsetKey.self,
                            value: -$0.frame(in: .named("scroll")).origin.x)
                    })
                    .onPreferenceChange(ViewOffsetKey.self) {
                        if initialised {
                            if $0 > self.initialOffset && $0 < self.maxOffset {
                                self.value = Int(viewModel.calculateValue(initialOffset: self.initialOffset, offset: $0, minVal: self.minVal, spacing: self.spacing))
                            } else if $0 <= self.initialOffset {
                                self.value = minVal
                            } else {
                                self.value = maxVal
                            }
                        } else {
                            self.initialOffset = $0
                            initialised = true
                        }
                    }
                    .scrollTargetLayout()
                    .offset(x: geometry.size.width / 2)
                }
                .introspect(.scrollView, on: .iOS(.v17)) { scrollView in
                    if !self.scrolledToStart {
                        self.scrolledToStart = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            scrollView.contentOffset.x = CGFloat(CGFloat(startValueOffset) * self.spacing)
                        }
                    }
                }
                .coordinateSpace(name: "scroll")
                .scrollIndicators(.hidden)
                .scrollTargetBehavior(.viewAligned)
                .scrollPosition(id: $scrollPosition, anchor: .center)
                .onAppear {
                    self.majorStopsCount = viewModel.calculateMajorStopsCount(minVal: self.minVal, maxVal: self.maxVal)
                    self.maxOffset = ((majorStopsCount - (viewModel.calculateSpacingCoeff(spacing: self.spacing))) + (majorStopsCount * 4)) * self.spacing
                }
            }
        }
        .overlay {
            PickerSelectorView(color: pickerColor, width: pickerWidth)
        }
    }
}

public struct ViewOffsetKey: PreferenceKey {
    public typealias Value = CGFloat
    public static var defaultValue = CGFloat.zero
    public static func reduce(value: inout Value, nextValue: () -> Value) {
        value += nextValue()
    }
}

@available(iOS 17.0.0, *)
#Preview {
    CustomHorizontalPicker(value: .constant(25), minVal: 0, maxVal: 100)
        .frame(height: 40)
}
