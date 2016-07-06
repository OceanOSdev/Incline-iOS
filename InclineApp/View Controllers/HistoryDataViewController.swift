//
//  HistoryDataViewController.swift
//  Incline
//
//  Created by Thomas Maloney on 7/5/16.
//  Copyright © 2016 Incline. All rights reserved.
//

import UIKit

class HistoryDataViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBAction func btnExit(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var chartView: ChartBaseView!

    var totalValuesDest: [String] = []
    var dateValuesDest: [String] = []
    var idValuesDest: [Int] = []
    var apiURL : String = ""
    var act: ActivityHelper = ActivityHelper()
    var chart: Chart?
    
    // Terrible Variables
    var layoutCounter: Int = 0
    var rawData: [Double] = []
    var yAxisLabel: String = ""
    // MARK: - View Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        /*if layoutCounter == 1 && asyncFinished{
            initChart()
        }
        
        layoutCounter += 1*/
        var thing = [(0, 0), (4, 4), (8, 11), (9, 2), (11, 10), (12, 3), (15, 18), (18, 10), (20, 15)]
    }
    
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(animated)
        
        act = ActivityHelper(parentView: self)
        
    }
    
    // MARK: - Chart Initializing
    
    func initChart() {
        let lineColor = UIColor.init(colorLiteralRed: 36/255.0, green: 149/255.0, blue: 223/255.0, alpha: 1.0)
        let labelSettings = ChartLabelSettings(font: ChartDefaults.labelFont)
        //[(0, 0), (4, 4), (8, 11), (9, 2), (11, 10), (12, 3), (15, 18), (18, 10), (20, 15)]
        let data = generateChartData()
        let chartPoints = data.map{ChartPoint(x: ChartAxisValueDouble($0.0, labelSettings: labelSettings), y: ChartAxisValueDouble($0.1))}
        
        let xValues = chartPoints.map{$0.x}
        let yValues = ChartAxisValuesGenerator.generateYAxisValuesWithChartPoints(chartPoints, minSegmentCount: 10, maxSegmentCount: 20, multiple: 2, axisValueGenerator: {ChartAxisValueDouble($0, labelSettings: labelSettings)}, addPaddingSegmentIfEdge: false)
        
        let xModel = ChartAxisModel(axisValues: xValues, axisTitleLabel: ChartAxisLabel(text: "Entry #", settings: labelSettings))
        let yModel = ChartAxisModel(axisValues: yValues, axisTitleLabel: ChartAxisLabel(text: yAxisLabel, settings: labelSettings.defaultVertical()))
        let chartFrame = ChartDefaults.chartFrame(chartView.bounds)
        let coordsSpace = ChartCoordsSpaceLeftBottomSingleAxis(chartSettings: ChartDefaults.chartSettings, chartFrame: chartFrame, xModel: xModel, yModel: yModel)
        let (xAxis, yAxis, innerFrame) = (coordsSpace.xAxis, coordsSpace.yAxis, coordsSpace.chartInnerFrame)
        
        let lineModel = ChartLineModel(chartPoints: chartPoints, lineColor: lineColor, lineWidth: 2, animDuration: 1, animDelay: 0)
        let chartPointsLineLayer = ChartPointsLineLayer(xAxis: xAxis, yAxis: yAxis, innerFrame: innerFrame, lineModels: [lineModel], pathGenerator: CubicLinePathGenerator(tension1: 0.3, tension2: 0.3))
        
        let settings = ChartGuideLinesDottedLayerSettings(linesColor: UIColor.blackColor(), linesWidth: ChartDefaults.guidelinesWidth)
        let guidelinesLayer = ChartGuideLinesDottedLayer(xAxis: xAxis, yAxis: yAxis, innerFrame: innerFrame, settings: settings)
        
        let chart = Chart(
            frame: chartFrame,
            layers: [
                xAxis,
                yAxis,
                guidelinesLayer,
                chartPointsLineLayer
            ]
        )
        chart.view.backgroundColor = UIColor.init(colorLiteralRed: 247/255.0, green: 247/255.0, blue: 247/255.0, alpha: 247/255.0)
        chartView.addSubview(chart.view)
        self.chart = chart

    }
    
    private func generateChartData() -> [(Double, Double)] {
        // It would be redundant to check if the id array is larger than 0 and the data array since they are both pulled from the same json thing.
        if (idValuesDest.count > 1) {
            var ids: [Double] = []
            
            for i in 1...(idValuesDest.count) {
                ids.append(Double(i))
            }
            
            let data = rawData.reverse()
            return Array(Zip2Sequence(ids, data))
        }
        else
        {
            var alertController = UIAlertController(title: "Info", message: "You can't see a graph until you have at least two entries", preferredStyle: UIAlertControllerStyle.Alert)
        
            alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default,handler: nil))
            alertController.view.tintColor = UIColor.init(red: 27/255.0, green: 152/255.0, blue: 224/255.0, alpha: 1.0)
        
            self.presentViewController(alertController, animated: true, completion: nil)
            
            return [(0,0)] // plot nothing
        }
    }
    
    // MARK: - Table view data source
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.totalValuesDest.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        if totalValuesDest.count > 0 {
            //cell.textLabel?.text = "\(totalValuesDest[indexPath.row])"
            cell.textLabel?.text = "\(totalValuesDest[indexPath.row])"
            (cell.contentView.subviews[1] as! UILabel).text = "\(dateValuesDest[indexPath.row])"
        }
        return cell

    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            WebApiConnector.Delete("\(self.apiURL)/\(idValuesDest[indexPath.row])", data: nil, completion: { (dataTask, httpResponse) in
                self.totalValuesDest.removeAtIndex(indexPath.row)
                self.dateValuesDest.removeAtIndex(indexPath.row)
                self.idValuesDest.removeAtIndex(indexPath.row)
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
                tableView.reloadData()
            })
            
            /*totalValuesDest.removeAtIndex(indexPath.row)
             tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
             print(totalValuesDest)*/
        } else if editingStyle == .Insert {
            
        }

    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1 // TODO: Probably change the value to a dynamic one
    }
    

    
}
