//
//  TKSectorProgressView.swift
//  TKSectorProgressView
//
//  Created by Tbxark on 8/4/16.
//  Copyright © 2016 Tbxark. All rights reserved.
//

import UIKit


public struct TKSectorProgressViewConfigure {
    var borderColor: UIColor = UIColor(red:0.862,  green:0.272,  blue:0.282, alpha:1)
    var fillColor: UIColor = UIColor.white
    var sectorColor: UIColor = UIColor(red:1,  green:0.493,  blue:0.474, alpha:1)
    var borderWidth: CGFloat = 0.5
    var innerInset: CGFloat = 5
}


open class TKSectorProgressView: UIView {
    
    open var progress: CGFloat = 0 {
        didSet {
            if progress != oldValue {
                setNeedsDisplay()
            }
        }
    }
    open var configure = TKSectorProgressViewConfigure() {
        didSet {
            setNeedsDisplay()
        }
    }
    fileprivate var targetProgress: CGFloat?
    fileprivate var progressStep: CGFloat = 1
    fileprivate var currentLink: CADisplayLink?
    open var animateDuration: TimeInterval = 1

    convenience public init() {
        self.init(frame: CGRect.zero)
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = UIColor.clear

    }
    
    
    
    open func setProgress(_ progress: CGFloat, animate: Bool) {
        if animate {
            currentLink?.invalidate()
            targetProgress = progress
            let link = CADisplayLink(target: self, selector: #selector(TKSectorProgressView.changeProgress))
            link.add(to: RunLoop.current, forMode: RunLoopMode.defaultRunLoopMode)
            progressStep = (progress - self.progress)/CGFloat(animateDuration * 60 / TimeInterval(link.frameInterval))
            currentLink = link
        } else {
            self.progress = progress
        }
    }
    
    @objc func changeProgress() {
        guard let target = targetProgress else { return }
        let newProgress = progressStep + progress
        progress = newProgress
        if abs(target - progress) < 0.000001 {
            progress = target
            currentLink?.invalidate()
            targetProgress = nil
        }
    }
    
    
    override open func draw(_ rect: CGRect) {
        let radius = min(rect.width, rect.height) - configure.borderWidth
        let pRect = CGRect(x: (rect.width - radius)/2,
                           y: (rect.height - radius)/2,
                           width: radius,
                           height: radius)
        let back = UIBezierPath(ovalIn: pRect)
        configure.borderColor.setStroke()
        configure.fillColor.setFill()
        back.lineWidth = configure.borderWidth
        back.fill()
        back.stroke()
        
        let center = CGPoint(x: rect.width/2, y: rect.height/2)
        let startAngle = CGFloat(-M_PI/2)
        let endAngle = min(progress, 1) * CGFloat(M_PI * 2) + startAngle
        let sectorPath = UIBezierPath(arcCenter: center,
                                      radius: radius/2 - configure.borderWidth/2 - configure.innerInset,
                                      startAngle: startAngle,
                                      endAngle: endAngle,
                                      clockwise: true)
        sectorPath.addLine(to: center)
        sectorPath.close()
        configure.sectorColor.setFill()
        sectorPath.fill()
    }
}
