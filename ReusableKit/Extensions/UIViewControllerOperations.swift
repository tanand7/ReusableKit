/**
 *  UIViewControllerOperations.swift
 *  ReusableKit
 *  This is an extension for UIViewController that helps to customize the UIViewController
 *  Created by ReusableKit on 10/21/16.
 *  Copyright © 2016 ReusableKit. All rights reserved.
 */

import Foundation
import UIKit

extension UIViewController {
    /// Showing the navigation bar
    open func showTopNavigationBar(){
        self.navigationController?.isNavigationBarHidden = false
    }
    
    /// Hiding the navigation bar
    open func hideTopNavigationBar(){
        self.navigationController?.isNavigationBarHidden = true
    }
    
    /// Hiding the background of navigation bar
    open func clearNavigationBackground(){
        // Hiding the background of navigation bar
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
    }
    
}
