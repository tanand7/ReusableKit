/**
 *  CustomButton.swift
 *  Anand
 *  Helps to set border for UI buttons
 *  Created by Anand on 29/06/16.
 *  Copyright © 2016 Anand. All rights reserved.
 */

import UIKit
@IBDesignable
open class CustomButton: UIButton {
    //ibinspectable to set the custom bordercolor for button
    @IBInspectable open var borderColor: UIColor = UIColor.clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    //ibinspectable to set the custom borderwidth for button
    @IBInspectable open var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    //ibinspectable to set the corner radius for button
    @IBInspectable open var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
 }
