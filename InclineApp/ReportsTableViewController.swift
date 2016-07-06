//
//  ReportsTableViewController.swift
//  Incline
//
//  Created by Thomas Maloney on 7/1/16.
//  Copyright © 2016 Incline. All rights reserved.
//

import UIKit

class ReportsTableViewController: UITableViewController {

    var chartThing: Chart? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        /*let chartConfig = ChartConfigXY(xAxisConfig: ChartAxisConfig(from: 2, to: 14, by: 2),
                                        yAxisConfig: ChartAxisConfig(from: 0, to: 14, by: 2))
        
        //let chartPointss: [ChartPoint] = [(2,2), (4,4), (6,6), (8,8), (9,9)].map{ChartPoint(x: ChartAxisValueInt($0.0), y: ChartAxisValueInt($0.1))}
        
        let chart = LineChart(frame: CGRectMake(0, 70, 300, 500), chartConfig: chartConfig, xTitle: "X", yTitle: "y", line: (chartPoints: [(2,2), (4,4), (6,6), (8,8), (9,9)], color: UIColor.redColor()))*/
        // map model data to chart points
        let chartPoints: [ChartPoint] = [(2, 2), (4, 4), (6, 6), (8, 10), (12, 14)].map{ChartPoint(x: ChartAxisValueInt($0.0), y: ChartAxisValueInt($0.1))}
        
        let labelSettings = ChartLabelSettings(font: ChartDefaults.labelFont)
        
        // define x and y axis values (quick-demo way, see other examples for generation based on chartpoints)
        let xValues = 0.stride(through: 16, by: 2).map {ChartAxisValueInt($0, labelSettings: labelSettings)}
        let yValues = 0.stride(through: 16, by: 2).map {ChartAxisValueInt($0, labelSettings: labelSettings)}
        
        // create axis models with axis values and axis title
        let xModel = ChartAxisModel(axisValues: xValues, axisTitleLabel: ChartAxisLabel(text: "Axis title", settings: labelSettings))
        let yModel = ChartAxisModel(axisValues: yValues, axisTitleLabel: ChartAxisLabel(text: "Axis title", settings: labelSettings.defaultVertical()))
        
        let chartFrame = ChartDefaults.chartFrame(self.view.bounds)
        
        // generate axes layers and calculate chart inner frame, based on the axis models
        let coordsSpace = ChartCoordsSpaceLeftBottomSingleAxis(chartSettings: ChartDefaults.chartSettings, chartFrame: chartFrame, xModel: xModel, yModel: yModel)
        let (xAxis, yAxis, innerFrame) = (coordsSpace.xAxis, coordsSpace.yAxis, coordsSpace.chartInnerFrame)
        
        // create layer with guidelines
        let guidelinesLayerSettings = ChartGuideLinesDottedLayerSettings(linesColor: UIColor.blackColor(), linesWidth: ChartDefaults.guidelinesWidth)
        let guidelinesLayer = ChartGuideLinesDottedLayer(xAxis: xAxis, yAxis: yAxis, innerFrame: innerFrame, settings: guidelinesLayerSettings)
        
        // view generator - this is a function that creates a view for each chartpoint
        let viewGenerator = {(chartPointModel: ChartPointLayerModel, layer: ChartPointsViewsLayer, chart: Chart) -> UIView? in
            let viewSize: CGFloat = 20
            let center = chartPointModel.screenLoc
            let label = UILabel(frame: CGRectMake(center.x - viewSize / 2, center.y - viewSize / 2, viewSize, viewSize))
            label.backgroundColor = UIColor.greenColor()
            label.textAlignment = NSTextAlignment.Center
            label.text = chartPointModel.chartPoint.y.description
            label.font = ChartDefaults.labelFont
            return label
        }
        
        // create layer that uses viewGenerator to display chartpoints
        let chartPointsLayer = ChartPointsViewsLayer(xAxis: xAxis, yAxis: yAxis, innerFrame: innerFrame, chartPoints: chartPoints, viewGenerator: viewGenerator)
        
        // create chart instance with frame and layers
        let chart = Chart(
            frame: chartFrame,
            layers: [
                coordsSpace.xAxis,
                coordsSpace.yAxis,
                guidelinesLayer,
                chartPointsLayer
            ]
        )
        self.chartThing = chart

        let container: UIView = UIView()
        
        container.frame = self.view.frame
        container.center = self.view.center
        container.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(container)
        self.view.addSubview(chart.view)
    }
    private var iPhoneChartSettings: ChartSettings {
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }
    
    func fontWithSize(size: CGFloat) -> UIFont {
        return UIFont(name: "Helvetica", size: size) ?? UIFont.systemFontOfSize(size)
    }
    func chartFramer(containerBounds: CGRect) -> CGRect {
        return CGRectMake(0, 70, containerBounds.size.width, containerBounds.size.height - 70)
    }
}
