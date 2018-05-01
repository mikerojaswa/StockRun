//
//  TriangleView.swift
//  StockRun
//
//  Created by Michael Rojas on 4/29/18.
//  Copyright © 2018 Michael Rojas. All rights reserved.
//

import UIKit

@IBDesignable
class TriangleView : UIView {
    var color: UIColor! = UIColor.blue

    
    
    @IBInspectable var fillColor: UIColor? {
        get { return color }
        set{ color = newValue }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        context.beginPath()
        context.move(to: CGPoint(x: rect.minX, y: rect.minY ))
        context.addLine(to: CGPoint(x: rect.maxX, y: rect.minY ))
        context.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY ))
        context.addLine(to: CGPoint(x: rect.minX, y: rect.maxY ))
        context.closePath()
        
        context.setFillColor(UIColor.clear.cgColor)
        context.fillPath()

        context.beginPath()
        context.move(to: CGPoint(x: rect.minX, y: rect.minY ))
        context.addLine(to: CGPoint(x: rect.maxX, y: (rect.maxY)/5 ))
        context.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY ))
        context.addLine(to: CGPoint(x: rect.minX, y: rect.maxY ))
        context.closePath()
        
        context.setFillColor(color.cgColor)
        context.fillPath()
    }
}

