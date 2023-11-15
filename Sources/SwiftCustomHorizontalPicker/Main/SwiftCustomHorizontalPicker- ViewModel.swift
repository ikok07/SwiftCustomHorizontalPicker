//
//  File.swift
//  
//
//  Created by Kaloyan Petkov on 15.11.23.
//

import SwiftUI
import Observation

@available(iOS 17.0.0, *)
extension CustomHorizontalPicker {
    @Observable class ViewModel {
        
        var minVal: Double = 0
        var maxVal: Double = 0
        
        var spaceBetweenStops: Double = 20
        
        func calculateMajorStopsCount() -> Int {
            let count = (maxVal - minVal) / 4
            return Int(count)
        }
        
    }
}
