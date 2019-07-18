//
//  DateExtension.swift
//  ReusableKit
//
//  Created by Anand T on 18/07/19.
//  Copyright © 2019 MyyShop. All rights reserved.
//

import Foundation

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
    
    /// Checks whether a date is between 2 dates
    ///
    /// - Parameters:
    ///   - startDate: start date or the smallest date
    ///   - endDate: end date or the largest date
    /// - Returns: true if the date falls between
    public func isBetween(StartDate startDate:Date, andEndDate endDate:Date) -> Bool {
        return (min(startDate, endDate) ... max(startDate, endDate)).contains(self)
    }
    
    /// Compares whether the date time is between 2 given times.
    /// This comparison verifies the time only
    /// - Parameters:
    ///   - startTime: Start time
    ///   - endTime: End time
    /// - Returns: true if the time falls between
    public func isTimeBetween(StartTime startTime:Date, andTime endTime:Date) -> Bool {
        
        return self.compareTimeOnly(date: startTime) == .orderedDescending && self.compareTimeOnly(date: endTime) == .orderedAscending
    }
    
    /// Compares the time between 2 dates
    ///
    /// - Parameter date: Date Time  to be compared
    /// - Returns: comparison result
    public func compareTimeOnly(date:Date) -> ComparisonResult {
        
        let calendar    = Calendar.current
        let components2 = calendar.dateComponents([.hour, .minute, .second], from: date)
        let date3       = calendar.date(bySettingHour: components2.hour!, minute: components2.minute!, second: components2.second!, of: self)!
        let seconds     = calendar.dateComponents([.second], from: self, to: date3).second!
        if seconds == 0 {
            return .orderedSame
        } else if seconds > 0 {
            // Ascending means before
            return .orderedAscending
        } else {
            // Descending means after
            return .orderedDescending
        }
    }
    /// Compares the time between 2 dates
    ///
    /// - Parameter date: Date to be compared
    /// - Returns: comparison result
    public func compareDateOnly(date:Date) -> ComparisonResult {
        
        let order = Calendar.current.compare(self, to: date, toGranularity: .day)
        switch order {
        case .orderedDescending:
            // Descending means after
            return .orderedDescending
        case .orderedAscending:
            // Ascending means before
            return .orderedAscending
        case .orderedSame:
            return .orderedSame
        }
        
    }
}
