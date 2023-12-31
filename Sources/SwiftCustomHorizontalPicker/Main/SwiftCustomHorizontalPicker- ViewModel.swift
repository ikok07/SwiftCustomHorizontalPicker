//
//  File.swift
//  
//
//  Created by Kaloyan Petkov on 15.11.23.
//

import SwiftUI
import Observation

@available(iOS 17.0.0, *)
public extension CustomHorizontalPicker {
    @Observable class ViewModel {
        public func calculateMajorStopsCount(minVal: Int, maxVal: Int) -> Double {
            let count: Double = Double(maxVal - minVal) / 5
            return count
        }
        
        public func calculateValue(initialOffset: Double, offset: Double, minVal: Int, spacing: CGFloat) -> Double {
            return (abs((initialOffset + (-offset)) / spacing) + Double(minVal))
        }
        
        public func calculateSpacingCoeff(spacing: CGFloat) -> Double {
            let difference = (spacing - 20) / 10
            let coeff = 10 - (difference * 5)
            return coeff
        }
    }
}
