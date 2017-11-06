//
//  CardView.swift
//  ReusableKit
//
//  Created by Anand T on 23/02/17.
//  Copyright © 2017 PurpleHealth. All rights reserved.
//

import UIKit

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
