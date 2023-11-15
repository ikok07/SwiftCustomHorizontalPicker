//
//  File.swift
//  
//
//  Created by Kaloyan Petkov on 15.11.23.
//

import SwiftUI

@available(iOS 17.0.0, *)
extension CustomHorizontalPicker {
    
    func modifyStops(color: Color = .gray.opacity(0.7), width: CGFloat = 3) -> CustomHorizontalPicker {
        var view = self
        view.stopsColor = color
        view.stopsWidth = width
        return view
    }
    
    func modifyMiniStops(color: Color = .gray.opacity(0.7), width: CGFloat = 3) -> CustomHorizontalPicker {
        var view = self
        view.miniStopsColor = color
        view.miniStopsWidth = width
        return view
    }
    
    func modifyPicker(color: Color = .accentColor, width: CGFloat = 3) -> CustomHorizontalPicker {
        var view = self
        view.pickerColor = color
        view.pickerWidth = width
        return view
    }
}
