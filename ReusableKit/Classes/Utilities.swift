/**
 *  Utilities.swift
 *  ReusableKit
 *  Contains the common functionalities that can be used all over the application
 *  Created by ReusableKit on 07/01/16.
 *  Copyright © 2016 ReusableKit. All rights reserved.
 */

import Foundation
import UIKit

/// Class contains the utility methods that are commonly used
open class Utilities {
    
    /**
     Displays a UIAlertController in the given view controller
     - parameter message: Message to be displayed
     - parameter view:    View Controller
     */
    open class func showAlertWithMessage(_ message:String, inViewController view:UIViewController) {
        displayAlertWithMessage(message, inViewController: view);
    }
    
    /**
     Invokes a given method with a delay
     - parameter method:  Method to be invoked
     - parameter seconds: delay to be applied
     */
    open class func invokeMethod(_ method:@escaping (() -> Void), withDelay seconds:Int) {
        invokeFunction(method, withDelay: seconds);
    }
    
    /**
     Returns the json data from a json file
     - parameter fileName:  File name of the json file
     - returns: Dictionary of string:AnyObject of json
     */
    open class func getJSONDataFromBundleFile(_ fileName:String) -> Dictionary<String,AnyObject> {
        return getJSONDataFromFile(fileName)!
    }
    
    /**
     Returns the json data from a json file
     - parameter fileName:  File name of the json file
     - returns: Dictionary of string:AnyObject of json
     */
    open class func getDummyReponseJSONFromBundleFile(_ fileName:String) -> Dictionary<String,AnyObject> {
        return getDummyResponeJSON(fromFile: fileName)
    }
    
    // MARK: - Private Methods -
    
    /**
     Displays a UIAlertController in the given view controller
     - parameter message: Message to be displayed
     - parameter view:    View Controller
     */
    fileprivate class func displayAlertWithMessage(_ message:String, inViewController view:UIViewController) {
        
        let dialog = UIAlertController(title: SystemInfoAPI.shared .appName, message: message, preferredStyle: .alert);
        let okayAction = UIAlertAction(title: "Ok", style: .default, handler: nil);
        dialog.addAction(okayAction);
        view.present(dialog, animated: true, completion: nil);
    }
    
    /**
     Invokes a given method with a delay
     - parameter method:  Method to be invoked
     - parameter delay: delay to be applied
     */
    fileprivate class func invokeFunction(_ method:@escaping (() -> Void), withDelay delay:Int) {
        let triggerTime = (Int64(NSEC_PER_SEC) * Int64(delay))
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(triggerTime) / Double(NSEC_PER_SEC), execute: { () -> Void in
            method();
        })
    }
    
    
    /**
     Reads the dummy JSON data from the given file from NSbundle and prepares a dictionary, specifically for APIs
     - parameter fileName: File Name
     - returns: JSON in Dictionary format [String:AnyObject]
     */
    fileprivate class func getDummyResponeJSON(fromFile fileName:String)->Dictionary<String,AnyObject>{
        
        var dummyData:[String:AnyObject]! = nil;
        var JSONData:Data?
        if let sampleJSONPath = Bundle.main.path(forResource: fileName, ofType: "json") {
            do {
                JSONData = try Data(contentsOf: URL(fileURLWithPath: sampleJSONPath), options: NSData.ReadingOptions()) as Data!
            } catch let error as NSError {
                print(error.localizedDescription)
            }
            do {
                let dictionary = try JSONSerialization.jsonObject(with: JSONData!, options: JSONSerialization.ReadingOptions()) as? [String : AnyObject]
                if dictionary != nil {
                    
                    if let result = dictionary!["result"] as? NSDictionary {
                        dummyData = result as? [String:AnyObject]
                    }
                } else {
                    print("Could not read the data")
                }
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
        
        guard dummyData != nil else {
            print("Please validate your JSON - \(fileName)")
            return [String:AnyObject]()
        }
        
        return dummyData
    }
    
    /**
     Reads the dummy JSON data from the given file from NSbundle and prepares a dictionary, specifically for APIs
     - parameter fileName: File Name
     - returns: JSON in Dictionary format [String:AnyObject]
     */
    fileprivate class func getJSONDataFromFile(_ fileName:String)->[String:AnyObject]?{
        
        var dummyData:[String:AnyObject]! = nil;
        var JSONData:Data?
        if let sampleJSONPath = Bundle.main.path(forResource: fileName, ofType: "json") {
            do {
                JSONData = try Data(contentsOf: URL(fileURLWithPath: sampleJSONPath), options: NSData.ReadingOptions()) as Data!
            } catch let error as NSError {
                print(error.localizedDescription)
            }
            do {
                let dictionary = try JSONSerialization.jsonObject(with: JSONData!, options: JSONSerialization.ReadingOptions()) as? [String : AnyObject]
                if dictionary != nil {
                    dummyData = dictionary
                } else {
                    print("Could not read the data")
                }
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
        
        guard dummyData != nil else {
            print("Please validate your JSON - \(fileName)")
            return nil
        }
        
        return dummyData
    }
}
