//
//  Helper.swift
//  ReusableKit
//
//  Created by Anand T on 22/09/20.
//  Copyright © 2020 MyyShop. All rights reserved.
//

import Foundation


// MARK: - Date Extension -



extension Array where Element : Equatable {
    
    /// Merges passed array into the given array
    /// - Parameter newElements: Array to be merged
    public mutating func mergeElements<C : Collection>(newElements: C) where C.Iterator.Element == Element{
        let filteredList = newElements.filter({!self.contains($0)})
        self.append(contentsOf: filteredList)
    }
}



extension UIImage {
    /**
     - Parameter cornerRadius: The radius to round the image to.
     - Returns: A new image with the specified `cornerRadius`.
     **/
    func roundedImage(cornerRadius: CGFloat) -> UIImage? {
        let size = self.size
        
        // create image layer
        let imageLayer = CALayer()
        imageLayer.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        imageLayer.contents = self.cgImage
        
        // set radius
        imageLayer.masksToBounds = true
        imageLayer.cornerRadius = cornerRadius
        
        // get rounded image
        UIGraphicsBeginImageContext(size)
        if let context = UIGraphicsGetCurrentContext() {
            imageLayer.render(in: context)
        }
        let roundImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return roundImage
    }
}

extension UIScrollView {
    
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.next?.touchesBegan(touches, with: event)
    }
}

