//
//  CardView.swift
//  ReusableKit
//
//  Created by Anand T on 23/02/17.
//  Copyright © 2017 PurpleHealth. All rights reserved.
//

import UIKit

@available(iOS, deprecated: 11.0, obsoleted: 11.0, message: "Use UICardView instead")
@IBDesignable
open class CardView: UIView {
    
    @IBInspectable open var masksToBounds:Bool = false {
        
        didSet {
            layer.masksToBounds = masksToBounds
        }
    }
    
    @IBInspectable open var shadowOffset:CGSize =  CGSize(width: 0, height: 5){
        
        didSet{
            layer.shadowOffset = shadowOffset
        }
    }
    
    @IBInspectable open var shadowRadius:CGFloat =  5 {
        
        didSet{
            layer.shadowRadius = shadowRadius
        }
    }
    
    @IBInspectable open var shadowOpacity:Float =  0.5 {
        
        didSet{
            layer.shadowOpacity = shadowOpacity
        }
    }
    
}

@available(iOS 11.0, *)
@IBDesignable
class UICardView: UIView {
    
    @IBInspectable var shadowOffsetWidth: Int  = 0
    @IBInspectable var shadowOffsetHeight: Int = 0
    @IBInspectable var shadowColor: UIColor?   = UIColor.black
    @IBInspectable var shadowOpacity: Float    = 0.5
    @IBInspectable var topLeft: Bool           = true
    @IBInspectable var topRight: Bool          = true
    @IBInspectable var bottomLeft: Bool        = true
    @IBInspectable var bottmRight: Bool        = true
    
    var arrayCorners:CACornerMask              = []
    
    override func layoutSubviews() {
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
