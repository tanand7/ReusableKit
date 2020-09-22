//
//  CardView.swift
//  ReusableKit
//
//  Created by Anand T on 23/02/17.
//  Copyright © 2017 PurpleHealth. All rights reserved.
//

import UIKit

@available(iOS 11.0, *)
@IBDesignable
open class UICardView: UIView {
    
    @IBInspectable open var shadowOffsetWidth: Int  = 0
    @IBInspectable open var shadowOffsetHeight: Int = 0
    @IBInspectable open var shadowColor: UIColor?   = UIColor.black
    @IBInspectable open var shadowOpacity: Float    = 0.5
    @IBInspectable open var topLeft: Bool           = true
    @IBInspectable open var topRight: Bool          = true
    @IBInspectable open var bottomLeft: Bool        = true
    @IBInspectable open var bottmRight: Bool        = true
    
    open var arrayCorners:CACornerMask              = []
    
    open override func layoutSubviews() {
        layer.cornerRadius                         = cornerRadius
        let shadowPath                             = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        
        layer.masksToBounds                        = false
        layer.shadowColor                          = shadowColor?.cgColor
        layer.shadowOffset                         = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight);
        layer.shadowOpacity                        = shadowOpacity
        layer.shadowPath                           = shadowPath.cgPath
        if(topLeft){arrayCorners.update(with: .layerMinXMinYCorner)}
        if(topRight){arrayCorners.update(with: .layerMaxXMinYCorner)}
        if(bottomLeft){arrayCorners.update(with: .layerMinXMaxYCorner)}
        if(bottmRight){arrayCorners.update(with: .layerMaxXMaxYCorner)}
        layer.maskedCorners                        = arrayCorners
    }
}
