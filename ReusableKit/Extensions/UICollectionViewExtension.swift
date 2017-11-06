//
//  UICollectionViewExtension.swift
//  ReusableKit
//
//  Created by Anand T on 20/09/17.
//  Copyright © 2017 MyyShop. All rights reserved.
//

import Foundation

extension UICollectionViewCell {
    
    /// Sets shadow to the cell
    open func setShadow() {
        self.layer.masksToBounds   = false
        self.layer.shadowOpacity   = 0.5
        self.layer.shadowRadius    = 5
        self.layer.shadowOffset    = CGSize.zero
        self.layer.shadowPath      = UIBezierPath(rect: self.bounds).cgPath
    }
}
