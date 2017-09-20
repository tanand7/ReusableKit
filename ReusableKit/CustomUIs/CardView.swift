//
//  CardView.swift
//  ReusableKit
//
//  Created by Anand T on 23/02/17.
//  Copyright © 2017 PurpleHealth. All rights reserved.
//

import UIKit

@IBDesignable
class CardView: UIView {
    
    @IBInspectable public var masksToBounds:Bool = false {
        
        didSet {
            layer.masksToBounds = masksToBounds
        }
    }
    
    @IBInspectable public var shadowOffset:CGSize =  CGSize(width: 0, height: 5){
        
        didSet{
            layer.shadowOffset = shadowOffset
        }
    }
    
    @IBInspectable public var shadowRadius:CGFloat =  5 {
        
        didSet{
            layer.shadowRadius = shadowRadius
        }
    }
    
    @IBInspectable public var shadowOpacity:Float =  0.5 {
        
        didSet{
            layer.shadowOpacity = shadowOpacity
        }
    }
    
}
