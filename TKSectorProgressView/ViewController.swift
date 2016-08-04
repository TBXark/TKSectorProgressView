//
//  ViewController.swift
//  TKSectorProgressView
//
//  Created by Tbxark on 8/4/16.
//  Copyright © 2016 Tbxark. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    private let progress = TKSectorProgressView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progress.center = view.center
        
        var rect = progress.frame
        rect.origin.y += rect.height + 20
        rect.size.height = 30
        let control = UISlider(frame: rect)
        
        view.addSubview(progress)
        view.addSubview(control)
        
        progress.configure.borderColor = UIColor(red:0.862,  green:0.272,  blue:0.282, alpha:1)
        progress.configure.fillColor = UIColor.whiteColor()
        progress.configure.sectorColor = UIColor(red:1,  green:0.493,  blue:0.474, alpha:1)
        progress.configure.borderWidth = 5
        progress.configure.innerInset CGFloat = 5
        progress.animateDuration = 2
        
        control.tintColor = progress.configure.borderColor
        control.addTarget(self, action: #selector(ViewController.changrProgress(_:)), forControlEvents: UIControlEvents.ValueChanged)
    }
    
    func changrProgress(slider: UISlider) {
        progress.progress = CGFloat(slider.value)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

