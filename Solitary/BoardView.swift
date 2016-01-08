//
//  BoardView.swift
//  Solitary
//
//  Created by Sam Tipton on 1/6/16.
//  Copyright © 2016 samtipton. All rights reserved.
//

import UIKit

@IBDesignable

class BoardView: UIView {

    @IBInspectable var boardColor: UIColor = UIColor.greenColor()
    
    //override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        
        let context = UIGraphicsGetCurrentContext()
        
        // set board color
        CGContextSetFillColorWithColor(context, boardColor.CGColor)
        CGContextFillRect(context, rect)
        
    }

}
