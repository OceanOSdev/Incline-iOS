//
//  ActivityHelper.swift
//  Incline
//
//  Created by Jake Schroeder on 6/30/16.
//  Copyright © 2016 Incline. All rights reserved.
//

import Foundation
import UIKit

class ActivityHelper {
    
    let activityView = UIActivityIndicatorView(activityIndicatorStyle: .WhiteLarge)

    let parentView: UIViewController?
    
    let container: UIView = UIView()
    let loadingView: UIView = UIView()
    
    init(parentView: UIViewController?){
        
        self.parentView = parentView
        
        activityView.color = UIColor.init(red: 27/255.0, green: 152/255.0, blue: 224/255.0, alpha: 1.0)
        
        initActivity()
        
    }
    
    init() {
        self.parentView = nil
    }
    
    func initActivity() {
        
        
        container.frame = parentView!.parentViewController!.view.frame
        container.center = parentView!.parentViewController!.view.center
        container.backgroundColor = UIColor.clearColor()
        
        //UIColorFromHex(0xffffff, alpha: 0.3)
        
        loadingView.frame = CGRectMake(0, 0, 80, 80)
        loadingView.center = parentView!.parentViewController!.view.center
        loadingView.backgroundColor = UIColor.whiteColor()//.colorWithAlphaComponent(0.7)
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 10
        
        activityView.frame = CGRectMake(0.0, 0.0, 40.0, 40.0);
        //activityView.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.WhiteLarge
        activityView.center = CGPointMake(loadingView.frame.size.width / 2,
                                    loadingView.frame.size.height / 2);
        
        activityView.hidesWhenStopped = true
        
        loadingView.addSubview(activityView)
        container.addSubview(loadingView)
        parentView!.parentViewController!.view.addSubview(container)
        activityView.startAnimating()
        
    }
    
    func stopActivityIndicator() {
        
        activityView.stopAnimating()
        
        loadingView.removeFromSuperview()
        
        container.removeFromSuperview()
    }
}