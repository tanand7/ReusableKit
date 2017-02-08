/**
 *  UIVIewOperations.swift
 *  ReusableKit
 *  This is an extension for Int class
 *  Created by ReusableKit on 09/01/16.
 *  Copyright © 2016 ReusableKit. All rights reserved.
 */

import Foundation
import UIKit

extension Int {
    
    /// Adds the rupee symbol and
    public var stringWithRupeeSymbol:String {
        
        return "₹ \(self)"
    }
    
    /// Converts integer to String
    public var asWord:String {
        
        return spellOut()
    }
    
    /// Converts the time in seconds to time format hh:mm:ss
    public var formattedTime:String {
        
        return convertToTimeString()
    }
    
    // MARK:- Private Methods -
    
    
    /// Converts the given time in seconds to the string
    ///
    /// - Returns: String value in format hh:mm:ss
    private func convertToTimeString() -> String {
        let seconds    = self % 60
        let minutes    = (self / 60) % 60
        let hours      = self / 3600
        let strHours   = hours > 9 ? String(hours) : "0" + String(hours)
        let strMinutes = minutes > 9 ? String(minutes) : "0" + String(minutes)
        let strSeconds = seconds > 9 ? String(seconds) : "0" + String(seconds)
        return "\(strHours):\(strMinutes):\(strSeconds)"
    }
    
    /// Spellout the given digits
    ///
    /// - Returns: String equivalent to the digit
    private func spellOut() -> String {
        let numberValue = NSNumber(value: self)
        let formatter = NumberFormatter()
        formatter.numberStyle = .spellOut
        return "\(formatter.string(from: numberValue)!)"
    }
}

extension Float {
    
    /// Adds the rupee symbol and
    public var stringWithRupeeSymbol:String {
        return "₹ \(self)"
    }
}
