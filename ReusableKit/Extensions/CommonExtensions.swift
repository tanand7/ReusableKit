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

extension Date {
    
    /// Helps to convert the date into given date format
    ///
    /// - Parameter toFormat: Format to which the date to be converted
    /// - Returns: date in the converted format
    public func convertTo(DateFormat toFormat:String) -> String {
        
        let dateFormatter        = DateFormatter()
        dateFormatter.dateFormat = toFormat
        
        return dateFormatter.string(from: self)
    }
    
    public var startOfWeek: Date? {
        let gregorian = Calendar(identifier: .gregorian)
        guard let sunday = gregorian.date(from: gregorian.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self)) else { return nil }
        return gregorian.date(byAdding: .day, value: 1, to: sunday)
    }
    
    public var endOfWeek: Date? {
        let gregorian = Calendar(identifier: .gregorian)
        guard let sunday = gregorian.date(from: gregorian.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self)) else { return nil }
        return gregorian.date(byAdding: .day, value: 7, to: sunday)
    }
}
