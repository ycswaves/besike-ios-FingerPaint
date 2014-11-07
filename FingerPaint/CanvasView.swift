//
//  CanvasView.swift
//  FingerPaint
//
//  Created by YCS on 5/11/14.
//  Copyright (c) 2014 ycswaves. All rights reserved.
//

import UIKit

class CanvasView: UIView {

    let zigzag = [(100,100),
        (100,150),(150,150),
        (150,200)]
    
    var paths: [Path] = [] {
        didSet {
            setNeedsDisplay()
        }
    }
    
    var currentColor: UIColor = UIColor.blackColor() {
        didSet {
            setNeedsDisplay()
        }
    }
    
    var currentPath: Path!
    
    override func drawRect(rect: CGRect) {
        
        for curPath in paths {
            // Get the drawing context.
            let context = UIGraphicsGetCurrentContext()
            let pathColor = curPath.color
            
            CGContextBeginPath(context)
            var startingPoint: (CGFloat, CGFloat) = (curPath.points[0].x, curPath.points[0].y)
            CGContextMoveToPoint(context, startingPoint.0, startingPoint.1)
            
            for i in 1..<curPath.points.count {
                var nodePoint: (CGFloat, CGFloat) = (curPath.points[i].x, curPath.points[i].y)
                CGContextAddLineToPoint(context, nodePoint.0, nodePoint.1)
                //println("print point \(nodePoint)")
            }
            
            // Configure the drawing environment.
            CGContextSetStrokeColorWithColor(context,pathColor.CGColor)
            
            // Request the system to draw.
            CGContextStrokePath(context)
        }
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        var newPath = Path(color: self.currentColor)
        currentPath = newPath
        paths.append(currentPath)
        let t = touches.anyObject() as UITouch
        let point = t.locationInView(self)
        currentPath.add(point)
        setNeedsDisplay()
        // TODO: Start a new path, and add the starting touch point to it.
    }
    
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        // TODO: Add a new touch point to the path
        let t = touches.anyObject() as UITouch
        let point = t.locationInView(self)
        currentPath.add(point)
        setNeedsDisplay()
    }
    
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        // TODO: Add the end touch point
        let t = touches.anyObject() as UITouch
        let point = t.locationInView(self)
        currentPath.add(point)
        setNeedsDisplay()
    }
}
