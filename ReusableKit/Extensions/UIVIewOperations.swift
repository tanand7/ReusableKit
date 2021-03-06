/**
 *  UIVIewOperations.swift
 *  ReusableKit
 *  This is an extension for UIView that helps to customize the UIView
 *  Created by ReusableKit on 09/01/16.
 *  Copyright © 2016 ReusableKit. All rights reserved.
 */

import Foundation
import UIKit

public extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    func springAnimation(){
        self.transform = CGAffineTransform(scaleX: 0.0, y: 0.1)
        UIView.animate(withDuration: 2.0,
                       delay: 0,
                       usingSpringWithDamping: 0.2,
                       initialSpringVelocity: 6.0,
                       options: .allowUserInteraction,
                       animations: { self.transform = .identity },
                       completion: nil)
    }
    
    func setGradient(PrimaryColor primaryColor:UIColor, andSecondaryColor secondaryColor:UIColor) {
        
        let colorTop            = primaryColor.cgColor
        let colorBottom         = secondaryColor.cgColor
        let gradientLayer       = CAGradientLayer()
        gradientLayer.colors    = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame     = self.bounds
        self.layer.insertSublayer(gradientLayer, above: nil)
    }
    
    /**
     Draws boreder for the view with given color and width
     - parameter color:  UIColor object in which the border to be drawn
     - parameter width:  Width of the border
     - parameter radius: Radius required for the view
     */
    func drawBorderWithColor(_ color:UIColor, borderWidth width:Float, andRadius radius:Float){
        // Sets the border Color
        self.layer.borderColor  = color.cgColor;
        // Sets the border width
        self.layer.borderWidth  = CGFloat(width);
        // Sets the corner radius
        self.layer.cornerRadius = CGFloat(radius);
    }
    
    /**
     Clears the border color of a UIView
     */
    func clearBorderColor(){
        // Sets the border Color
        self.layer.borderColor  = UIColor.clear.cgColor;
    }
    
    /**
     Marks a red border around view
     */
    func markAsErrorView(){
        self.drawBorderWithColor(UIColor.red, borderWidth: 1.0, andRadius: 1.0);
    }
    
    /**
     Converts a view to circular view from rectangular view
     */
    func makeCircularView() {
        self.layer.cornerRadius = self.frame.size.width/2;
    }
    
    /**
     Animates the UIView with shake effects
    */
    func shakeAnimation(){
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 4
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 10, y: self.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 10, y: self.center.y))
        self.layer.add(animation, forKey: "position")
    }
    
    func flashAnimation(){
        
        let flash = CABasicAnimation(keyPath: "opacity")
        flash.duration = 0.5
        flash.fromValue = 1
        flash.toValue = 0.1
        flash.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        flash.autoreverses = true
        flash.repeatCount = 2
        layer.add(flash, forKey: nil)
    }
    
    /**
     Adds a blur view to the current view
     */
    func addBlurView(){
        
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight] // for supporting device rotation
        self.addSubview(blurEffectView)
    }
    
    func setBackgroundImage(image:UIImage){
        UIGraphicsBeginImageContext(self.frame.size)
        image.draw(in: self.bounds)
        
        if let image: UIImage = UIGraphicsGetImageFromCurrentImageContext() {
            self.backgroundColor = UIColor(patternImage: image)
        }
        
        defer {
            UIGraphicsEndImageContext()
        }
    }
}

