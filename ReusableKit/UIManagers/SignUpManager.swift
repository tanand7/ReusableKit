/**
 *  SignUpManager.swift
 *  ReusableKit
 *  Functionalities for the components needed for a registration/Sign up
 *  Created by Anand on 6/2/16.
 *  Copyright © 2016 Anand. All rights reserved.
 */

import UIKit

/**
 * The SignupManagerDelegate protocol defines methods that are called by the LoginManager class
 * object in response to important events during login
 */
@objc public protocol SignupManagerDelegate {
    // MARK: - Mandatory delegate functions
    
    /**
     Tells the delegate that the registration data is valid and proceed with the user data
     - parameter userData: Dictionary ([String:String]) of user data
     */
    func registerUserWithData(userData:[String:String])
    
    /**
     Tells the delegate that the signup is failed
     - parameter error: Reason for the failure
     */
    func errorInRegistration(error:String)
    
    // MARK: - Optional delegate functions
    
    /**
     Tells the delegate that the user tapped privacy policy button
     */
    @objc optional func didTapPrivacyPolicyURL()
   
    /**
     Tells the delegate that the user tapped terms and conditions
     */
    @objc optional func didTapTermsAndConditionsURL()
}

/// Class that contains basic functionalities for a registration view contoller
open class SignUpManager: UIViewController {

    // MARK: - Properties -
    
    /// Stores the error message if any error occurs
    open var errorMessage = ""
    
    /// Delegate for the signup manager
    weak var signupDelegate:SignupManagerDelegate?
    
    // MARK: - Outlets -
    
    /// TextField for First Name
    @IBOutlet weak open var txtFirstName: UITextField!
    /// TextField for Last Name
    @IBOutlet weak open var txtLastName: UITextField?
    /// TextField for EmailID
    @IBOutlet weak open var txtEmailID: UITextField?
    /// Text Field for Phone Number
    @IBOutlet weak open var txtPhoneNumber: UITextField?
    /// TextField for Password
    @IBOutlet weak open var txtPassword: UITextField!
    /// TextField for ConfrimPassword
    @IBOutlet weak open var txtConfirmPassword: UITextField!
    /// Button for Sign up
    @IBOutlet weak open var btnSignup:UIButton?
    
    /**
     Function when sign up button tapped
     - parameter sender: AnyObject
     */
    @IBAction public final func tappedSignupButton(sender:AnyObject){
        performSignup()
    }
    
    /**
     Function when privacy policy button tapped
     - parameter sender: AnyObject
     */
    @IBAction open func tappedPrivacyPolicyURL(sender:AnyObject){
        signupDelegate?.didTapPrivacyPolicyURL?()
    }
    
    /**
     Function when terms and condition button tapped
     - parameter sender: AnyObject
     */
    @IBAction open func tappedTermsAndConditionsURL(sender:AnyObject){
        signupDelegate?.didTapTermsAndConditionsURL?()
    }
    
    /**
     Performs basic validatins on the available user data
     - returns: true if validation is success
     */
    open func isValidRegistrationData()->Bool{
        return isValidRegistration()
    }
    
    // MARK: Private Methods
    
    /**
     Function to initiate delegate functions for Sign up/error
     */
    private func performSignup(){
        if (isValidRegistration()){
            let userData = getUserData();
            signupDelegate?.registerUserWithData(userData: userData);
        } else {
            signupDelegate?.errorInRegistration(error: errorMessage)
        }
    }
    
    /**
     Function to get user data dictionary for registartion
     - returns: userData [String:String]
     */
    private func getUserData()->[String:String]{
        
        var userData = [String:String]()
        userData["FirstName"]   = txtFirstName.text
        userData["LastName"]    = (txtLastName?.text! == "") ? "" : txtLastName?.text
        userData["EmailID"]     = (txtEmailID?.text! == "") ? "" : txtEmailID?.text
        userData["PhoneNumber"] = (txtPhoneNumber?.text! == "") ? "" : txtPhoneNumber?.text
        userData["Password"]    = txtPassword.text
        
        return userData
    }
    
    /**
     Function that validates the given registeration data
     - returns: true if the registeration data is valid
     */
    private func isValidRegistration() -> Bool{
        var isValidUser = true;
        
        if (txtFirstName.text == "") {
            isValidUser = false;
            errorMessage = "First Name is empty"
        } else if (txtLastName?.text == "") {
            isValidUser = false;
            errorMessage = "Last name is empty"
        } else if (txtEmailID?.text == "") {
            isValidUser = false;
            errorMessage = "Email Id is empty"
        } else if (txtPassword.text == "") {
            isValidUser = false;
            errorMessage = "Password is empty"
        } else if (txtConfirmPassword.text == "") {
            isValidUser = false;
            errorMessage = "Confirm password is empty"
        } else if (txtPassword.text != txtConfirmPassword.text){
            isValidUser = false;
            errorMessage = "Password and Confirm password are not matching"
        }
        return isValidUser;
    }

}
