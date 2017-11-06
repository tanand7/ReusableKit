/*!
 *  LoginManager.swift
 *  ReusableKit
 *  Helps to manage the login functionality
 *  Created by Anand T on 30/05/16.
 *  Copyright © 2016 Anand. All rights reserved.
 */

import UIKit


/**
 * The LoginManagerDelegate protocol defines methods that are called by the LoginManager class
 * object in response to important events during login
 */
@objc public protocol LoginManagerDelegate {
    
    /**
     Tells the delegate to proceed login with the username and password
     - parameter username: Username for the login
     - parameter password: Password for the login
     */
    func loginWithUsername(username:String, andPassword password:String)
    
    /**
     Tells the delegate that an error occurred during login
     - parameter error: Error message
     */
    func errorInLogin(error:String)
    
    /**
     Tells the delegate that the user tapped signup button
     */
    @objc optional func didTapSignupButton()
    
    /**
     Tells the delegate that the user tapped forgot password button
     */
    @objc optional func didTapForgotPassword()
    
}

/// LoginManager helps to manage the login process much easily
/// It reduces the developer effort by avoiding basic validations, variable declarations etc
/// This is inherited from a UIViewController class
open class LoginManager:UIViewController {
    
    /// Stores the login delegate. This will notifies the receiever about important events
    open weak var loginDelegate:LoginManagerDelegate?
    
    /// Defines the username field
    @IBOutlet open weak var txtUsername:UITextField!
    /// Defines the password field
    @IBOutlet open weak var txtPassword:UITextField!
    /// Defines the login submit button
    @IBOutlet open weak var btnSubmitButton:UIButton!
    /// Defines the signup button
    @IBOutlet open weak var btnSignupButton:UIButton?
    /// Defines the forgot password button
    @IBOutlet open weak var btnForgotPassword:UIButton?
    
    /// Stores the error message that occurrs during signup process
    open var errorMessage = ""
    
    /// Invokes when the user taps on the login button
    @IBAction public final func tappedLoginButton(sender:UIButton){
        performUserLogin()
    }
    
    /// Invokes when the user taps on the signup button
    @IBAction public final func tappedSignupButton(sender:UIButton){
        showSignup()
    }
    
    /// Invokes when the user taps on the forgot password button
    @IBAction public final func tappedForgorPassword(sender:UIButton){
        showForgotPassword()
    }
    
    // Mark: open Methods
    
    /**
     Validates the user inputs, checks for empty fields in the form
     - returns: returns true if there is no empty fields
     */
    open func validateUserDetails() -> Bool {
        return isValidUserData()
    }
    
    // Private methods
    
    /**
     Validates the login data and tells the result to the delegate
     */
    private func performUserLogin() {
        
        // Shows the signup screen, if the delegate is set
        if loginDelegate != nil {
            if validateUserDetails() {
                // User details are valid.
                loginDelegate!.loginWithUsername(username: txtUsername!.text!, andPassword: txtPassword!.text!)
            } else {
                loginDelegate!.errorInLogin(error: errorMessage)
            }
        }
    }
    
    /**
     Invoked when the signup button is tapped
     */
    private func showSignup() {
        // Shows the signup screen, if the delegate is set
        loginDelegate?.didTapSignupButton?()
    }
    
    /**
     Invoked when the forgot password button is tapped
     */
    private func showForgotPassword(){
        // Shows the signup screen, if the delegate is set
        loginDelegate?.didTapForgotPassword?()
    }
    
    /**
     Performs basic validation on the user inputs
     - returns: true if the input data is correct
     */
    private func isValidUserData()->Bool{
        var isValidUser = true;
        
        let username = txtUsername?.text
        let password = txtPassword?.text
        
        if username?.isEmpty == true {
            isValidUser = false
            errorMessage = "Invalid username"
        } else if password?.isEmpty == true {
            isValidUser = false
            errorMessage = "Invalid password"
        }
        
        return isValidUser;
    }
}
