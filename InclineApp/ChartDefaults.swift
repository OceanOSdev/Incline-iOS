//
//  ChartDefaults.swift
//  Incline
//
//  Created by Thomas Maloney on 7/1/16.
//  Copyright © 2016 Incline. All rights reserved.
//


import UIKit

struct ChartDefaults {
    
    static var chartSettings: ChartSettings {
        return self.iPhoneChartSettings
    }
    
    
    private static var iPhoneChartSettings: ChartSettings {
        let chartSettings = ChartSettings()
        chartSettings.leading = 10
        chartSettings.top = 10
        chartSettings.trailing = 10
        chartSettings.bottom = 10
        chartSettings.labelsToAxisSpacingX = 5
        chartSettings.labelsToAxisSpacingY = 5
        chartSettings.axisTitleLabelsToLabelsSpacing = 4
        chartSettings.axisStrokeWidth = 0.2
        chartSettings.spacingBetweenAxesX = 8
        chartSettings.spacingBetweenAxesY = 8
        return chartSettings
    }
    
    static func chartFrame(containerBounds: CGRect) -> CGRect {
        return CGRectMake(0, 10, containerBounds.size.width, containerBounds.size.height - 10)
    }
    
    static var labelSettings: ChartLabelSettings {
        return ChartLabelSettings(font: ChartDefaults.labelFont)
    }
    
    static var labelFont: UIFont {
        return ChartDefaults.fontWithSize(11)
    }
    
    static var labelFontSmall: UIFont {
        return ChartDefaults.fontWithSize(10)
    }
    
    static func fontWithSize(size: CGFloat) -> UIFont {
        return UIFont(name: "Helvetica", size: size) ?? UIFont.systemFontOfSize(size)
    }
    
    static var guidelinesWidth: CGFloat {
        return 0.1
    }
    
    static var minBarSpacing: CGFloat {
        return 5
    }
}
