/**
 *  StringOperations.swift
 *  ReusableKit
 *  Contains additional feature for Data class
 *  Created by ReusableKit on 07/01/16.
 *  Copyright © 2016 ReusableKit. All rights reserved.
 */

import Foundation

extension Data {
    
    /// Gets the hex string from the data
    public var hexString:String {
        get {
            return getHexString()
        }
    }
    
    /// Retrieves the device token from the data
    public var deviceToken:String {
        
        get {
            return extractToken()
        }
    }
    
    /**
     Appends a string to data after converting to utf8
     - parameter string: String to be appended
     */
    mutating public func appendString(string:String){
        self.append(string.data(using: .utf8)!)
    }
    
    /**
     Extracts the device token string from device token
     - parameter deviceToken: Device token in the form NSData
     - returns: String values
     */
    private func extractToken() -> String {
        return self.reduce("", {$0 + String(format: "%02X", $1)});
    }
    
        private func getHexString() -> String {
        var bytesPointer: UnsafeBufferPointer<UInt8> = UnsafeBufferPointer(start: nil, count: 0)
        self.withUnsafeBytes { (bytes) in
            bytesPointer = UnsafeBufferPointer<UInt8>(start: UnsafePointer(bytes), count:self.count)
        }
        let hexBytes = bytesPointer.map { return String(format: "%02hhx", $0) }
        return hexBytes.joined()
    }
}
