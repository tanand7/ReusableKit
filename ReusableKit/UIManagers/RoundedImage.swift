/**
 *  RoundedImage.swift
 *  Anand
 *  Helps to set border for UIImageViews
 *  Created by Anand on 29/06/16.
 *  Copyright © 2016 Anand. All rights reserved.
 */

import UIKit

@IBDesignable public class RoundedImage: UIImageView {
    //ibinspectable to set the custom bordercolor for button
    @IBInspectable public var borderColor: UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    //ibinspectable to set the custom borderwidth for button
    @IBInspectable public var borderWidth: CGFloat = 0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    //ibinspectable to set the corner radius for button
    @IBInspectable public var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
            self.clipsToBounds      = true
        }
    }
    
}

