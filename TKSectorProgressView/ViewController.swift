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
        progress.configure.borderWidth = 5
//        progress.setProgress(1, animate: true) // Change progress with animation
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

