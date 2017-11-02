/**
 *  CustomTextField.swift
 *  Anand
 *  Helps to set boreder for UITextfield
 *  Created by Anand on 29/06/16.
 *  Copyright © 2016 Anand. All rights reserved.
 */

import UIKit
@IBDesignable
public class CustomTextField:UITextField {
    
    public var padding = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5);
    
    override public func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override public func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override public func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    // IBInspectable for placehodler color
    @IBInspectable public var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedStringKey.foregroundColor: newValue!])
        }
    }
    
    // IBInspectable to set the custom bordercolor  for the textfield
    @IBInspectable public var bordercolor:UIColor = UIColor.clear{
        didSet {
            layer.borderColor = bordercolor.cgColor
        }
    }
    
    // IBInspectable to set the custom borderwidth for the textfield
    @IBInspectable public var borderwidth:CGFloat = 0 {
        didSet{
            layer.borderWidth = borderwidth
        }
    }
    // IBInspectable to set the corner radius for the textfield
    @IBInspectable public var cornerradius:CGFloat = 0 {
        didSet{
            layer.cornerRadius = cornerradius
        }
    }
    
}
