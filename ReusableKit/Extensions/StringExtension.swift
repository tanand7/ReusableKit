/**
 *  StringExtension.swift
 *  ReusableKit
 *  This is an extension for String class that helps to perform string operations like validations
 *  Created by ReusableKit on 07/01/16.
 *  Copyright © 2016 ReusableKit. All rights reserved.
 */

import Foundation

extension String {
    
    /// Retrieves the length of the string
    public var length:Int{
        
        return self.characters.count
    }
    
    /// Generates UIColor from hex string
    public var color:UIColor {
        return getUIColorFromHEXString()
    }
    
    /// Generates string by removing white spaces from both end
    public var trimmed:String {
        
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines);
    }
    
    /// Removes rupee symbol from the integer
    public var numberWithoutRupeeSymbol:Int{
        return removeSymbol()
    }
    
    /// Generates a decimal number after removing the rupee symbol
    public var decimalWithoutRupeeSymbol:Float {
        
        var actualValue:Float = 0.0
        let plainText         = self.replacingOccurrences(of: "₹", with: "").trimmed
        actualValue           = Float(plainText)!
        return actualValue
    }
    
    /// Checks whether the string is a valid email or not
    public var isEmail:Bool {
        return isAnEmail()
    }
    
    /// Checks whether the phone number is valid Indian number or not
    public var isIndianPhone:Bool {
        return isPhoneNumber()
    }
    
    /// Checks whether the string is a valid numeric value
    public var isNumeric:Bool {
        return isValidNumeric()
    }
    
    /// Checks whether the string contains alphabets only
    public var isAlphabetsOnly:Bool{
        return hasInvalidCharactersInName()
    }
    
    /// Checks whether the string is non empty or not
    public var isNonEmpty:Bool{
        return (self.trimmed.length > 0) ? true : false;
    }
   
    /// Converts the string to type safe Int
    public var typeSafeInt:Int {
        if let safeInt = Int(self) {
            return safeInt
        } else {
            return 0
        }
    }
    
    /// Extracts the plain text from a html string
    public var plainText:String {
        
        return self.htmlAttributeString.string
    }
    
    /// Provides the html attributted string
    public var htmlAttributeString:NSAttributedString {
        return getAttributtedString()
    }

    /// Generates random string with given length
    ///
    /// - Parameter length: Length of the random string
    /// - Returns: Random string
    public func randomString(ofLength length: Int) -> String {
        return randomString(length: length)
    }
    
    /// Returns the boolvalue from string
    public var boolValue:Bool {
        return (self.uppercased() == "NA") ? false : NSString(string: self).boolValue
    }
    
    /// Converts milliseconds to date, returns nil if invalid data passed
    public var milliSecondsToDate:Date? {
        
        guard let int64 = Int64(self) else {
            return nil
        }
        
        let doubleValue = Double(int64/1000)
        
        return Date(timeIntervalSince1970: doubleValue)
    }
    
    /// Converts a date string from one format to another format
    ///
    /// - Parameters:
    ///   - toFormat: New format to which the date should be converted
    ///   - fromFormat: Current format of the date
    /// - Returns: Date string with new format
    public func convertTo(DateFormat toFormat:String, fromFromat fromFormat:String) -> String {
        
        var convertedString       = self
        let inputFormatter        = DateFormatter()
        inputFormatter.dateFormat = fromFormat
        
        if let date = inputFormatter.date(from: self) {
            inputFormatter.dateFormat = toFormat
            convertedString           = inputFormatter.string(from: date)
        }
        
        return convertedString
    }
    
    // MARK:- Private Methods -
    
    /// Verify whether the string is an email or not
    private func isAnEmail() -> Bool {
        // Regex represents the email ID
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}";
        // Evaluating the string with email regex and returns true if it is valid
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: self);
    }
    
    /// The method verifys whether the string contains only 10 digits and contains numbers only
    private func isPhoneNumber() -> Bool {
        // Regex for phone number with 10 digits
        let phoneRegex = "^\\d{10}$";
        // Evaluating the string with phone number regex and returns true if it is valid
        return NSPredicate(format: "SELF MATCHES %@", phoneRegex).evaluate(with: self)
    }
    
    /// The method verifys whether the given string is an integer or decimal
    private func isValidNumeric() -> Bool {
        // Regex for numerics (integers and decimals)
        let numberRegex = "^([0-9]*|[0-9]*[.][0-9]*)$";
        // Evaluating the string with numeric regex and returns true if it is valid
        return NSPredicate(format: "SELF MATCHES %@", numberRegex).evaluate(with: self)
    }
    
    /// Generates UIColor from hex string
    private func getUIColorFromHEXString() -> UIColor {
        var color:UIColor = UIColor.black;
        // Removing the whitespaces and converting the string to upper case
        var cString:String = self.trimmed.uppercased();
        // Removing # from the string, if exists
        if (cString.hasPrefix("#")) {
            cString = (cString as NSString).substring(from: 1)
        }
        
        // Verifying whether the string has only 6 letters and converting the hex string to UIColor
        if (cString.characters.count == 6) {
            var rgbValue:UInt32 = 0
            Scanner(string: cString).scanHexInt32(&rgbValue);
            color = UIColor(red: CGFloat((rgbValue & 0xFF0000) >> 16)/255.0, green: CGFloat((rgbValue & 0x00FF00) >> 8)/255.0,
                            blue: CGFloat(rgbValue & 0x0000FF)/255.0, alpha: CGFloat(1.0));
        }
        
        return color;
    }
    
    /// Checks whether the string contains invalid characters in name
    private func hasInvalidCharactersInName() -> Bool {
        let invalidCharSet = CharacterSet(charactersIn: "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz ").inverted;
        let trimmedReplacement = self.components(separatedBy: invalidCharSet).joined(separator: "");
        return ((trimmedReplacement.trimmingCharacters(in: invalidCharSet) == self) ? true : false)
    }
    
    /// The method that removes an "₹" from the string value with "₹" symbol
    private func removeSymbol() -> Int {
        let plainText   = self.replacingOccurrences(of: "₹", with: "").trimmed
        return plainText.typeSafeInt
    }
    
    /// Generates random string with given length
    private func randomString(length: Int) -> String {
        
        let charactersString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let charactersArray : [Character] = Array(charactersString.characters)
        
        var string = ""
        for _ in 0..<length {
            string.append(charactersArray[Int(arc4random()) % charactersArray.count])
        }
        
        return string
    }
    
    /// The method that takes an html string and converst it into attributed string
    private func getAttributtedString() -> NSAttributedString{
        var attributedString:NSAttributedString = NSAttributedString(string: self)
        do {
            attributedString = try NSAttributedString(data: self.data(using: String.Encoding.unicode)!, options: [NSDocumentTypeDocumentAttribute : NSHTMLTextDocumentType], documentAttributes: nil)
        } catch(let error as NSError){
            debugPrint(error.localizedDescription)
        }
        return attributedString
    }
}
