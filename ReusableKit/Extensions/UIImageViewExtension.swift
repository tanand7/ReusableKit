//
//  CustomExtensions.swift
//  ReusableKit
//
//  Created by Anand on 16/01/17.
//  Copyright © 2017 Anand. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    open func downloadedFrom(url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { () -> Void in
                self.image = image
            }
            }.resume()
    }
    
    open func downloadedFrom(link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloadedFrom(url: url, contentMode: mode)
    }
    
    open func scaleForCircularImage() {
        self.layer.masksToBounds = false
        self.clipsToBounds       = true
        self.contentMode         = UIView.ContentMode.scaleAspectFill
        self.cornerRadius        = 10
    }
}

