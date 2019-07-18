//
//  CommonExtensions.swift
//  ReusableKit
//
//  Created by Anand T on 20/09/17.
//  Copyright © 2017 MyyShop. All rights reserved.
//

import Foundation

extension Dictionary where Key: Comparable, Value: Equatable {
    
    public func difference(WithDictionary dictionary: [Key:Value]) -> [Key:Value] {
        
        let entriesInSelfAndNotInDict = filter { dictionary[$0.0] != self[$0.0] }
        return entriesInSelfAndNotInDict.reduce([Key:Value]()) { (result, entry) -> [Key:Value] in
            var newDict      = result
            newDict[entry.0] = entry.1
            return newDict
        }
    }
}

// MARK: - Array Extension -

extension Array {
    
    /// Whetehr the array is non empty or not
    public var isNonEmpty:Bool {
        return !self.isEmpty
    }
}

extension Bool {
    public var intValue: Int {
        return self ? 1 : 0
    }
}

// MARK: - Double Extension -

extension Double {
    
    var currencyFormat:String {
        return NumberFormatter.localizedString(from: NSNumber(value: self), number: .currency)
    }
    
    func roundTo(places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

// MARK: - Copying for Swift -

protocol Copying {
    init(instance:Self)
}

extension Copying {
    
    /// making copy of current object
    func copy() -> Self {
        return Self.init(instance: self)
    }
}

// MARK: - Rotatable View -

@IBDesignable
class UIRotatableLabel:UILabel {
    @IBInspectable public var angle:CGFloat = 0.0 {
        didSet {
            
            self.layer.anchorPoint = CGPoint.zero
            self.transform         = CGAffineTransform(rotationAngle: CGFloat.pi * angle/180.0)
        }
    }
}

extension SystemInfoAPI {
    
    // Defines the bundle version
    public var bundleVersion:String {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String ?? ""
    }
}

extension URL {
    
    public func valueOf(Parameter parameterName:String) -> String? {
        guard let url = URLComponents(string: self.absoluteString) else { return nil }
        return url.queryItems?.first(where: { $0.name == parameterName })?.value
    }
}
