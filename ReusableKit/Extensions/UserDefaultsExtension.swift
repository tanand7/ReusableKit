/**
 *  UserDefaultsExtension.swift
 *  ReusableKit
 *  This is an extension for the USerDefaults that helps to customize NSUserDefaults
 *  Created by ReusableKit on 19/02/16.
 *  Copyright © 2016 ReusableKit. All rights reserved.
 */

import Foundation

extension UserDefaults {
    
    /**
     Sets a custom object into the NSUserDefaults
     - parameter object: Object to be saved to the memory
     - parameter key:    key for which the data to be stored
     */
    open func setCustomObject(_ object:AnyObject, forKey key:String) {
        addObject(object, forKey: key);
    }
    
    /**
     Gets a custom object from the NSUserDefaults
     - parameter key: Key to get the saved data
     - returns: Object saved, returns nil if object not available
     */
    open func customObjectForKey(_ key:String) -> AnyObject?{
        
        return getCustomObjectForKey(key);
    }
    
    /**
     Sets a custom object into the NSUserDefaults
     - parameter object: Object to be saved to the memory
     - parameter key:    key for which the data to be stored
     */
    private func addObject(_ object:AnyObject, forKey key:String){
        // Encoding the given object
        let encodedObject:Data = NSKeyedArchiver.archivedData(withRootObject: object);
        // Saving the object to the NSUserDefaults
        set(encodedObject, forKey: key);
    }
    
    /**
     Gets a custom object from the NSUserDefaults
     - parameter key: Key to get the saved data
     - returns: Object saved, returns nil if object not available
     */
    private func getCustomObjectForKey(_ key:String) -> AnyObject?{
        
        // Represents the saved object
        var savedObject:AnyObject?
        // Verifying whether any data available on the memory
        if let encodedObject = object(forKey: key) as? Data {
            savedObject = NSKeyedUnarchiver.unarchiveObject(with: encodedObject) as AnyObject?;
        }
        
        return savedObject;
    }
}
