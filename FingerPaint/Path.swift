//
//  Path.swift
//  FingerPaint
//
//  Created by YCS on 7/11/14.
//  Copyright (c) 2014 ycswaves. All rights reserved.
//

import Foundation
import UIKit
class Path {
    var points: [CGPoint] = []
    let color: UIColor
    init(color: UIColor) {
        self.color = color
    }
    
    func add(point: CGPoint) {
        points.append(point)
    }
}