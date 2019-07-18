/**
 *  CustomTextField.swift
 *  Anand
 *  Helps to set boreder for UITextfield
 *  Created by Anand on 29/06/16.
 *  Copyright © 2016 Anand. All rights reserved.
 */

import UIKit
@IBDesignable
open class CustomTextField:UITextField {
    
    open var padding = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5);
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    // IBInspectable for placehodler color
    @IBInspectable open var placeHolderColor: UIColor? {
        
        didSet {
            guard let color = placeHolderColor else { return }
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: color])
        }
    }
    
    // IBInspectable to set the custom bordercolor  for the textfield
    @IBInspectable open var bordercolor:UIColor = UIColor.clear{
        didSet {
            layer.borderColor = bordercolor.cgColor
        }
    }
    
    // IBInspectable to set the custom borderwidth for the textfield
    @IBInspectable open var borderwidth:CGFloat = 0 {
        didSet{
            layer.borderWidth = borderwidth
        }
    }
    // IBInspectable to set the corner radius for the textfield
    @IBInspectable open var cornerradius:CGFloat = 0 {
        didSet{
            layer.cornerRadius = cornerradius
        }
    }
    
}
