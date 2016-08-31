//
//  RegisterViewController.swift
//  FinalProject
//
//  Created by student on 11/21/2558 BE.
//  Copyright © 2558 student. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var masterPasswordTextField: UITextField!
    @IBOutlet var reMasterPasswordTextField: UITextField!
    @IBOutlet var secretKeyTextField: UITextField!
    let defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        masterPasswordTextField.delegate = self
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 8
        let currentString: NSString = masterPasswordTextField.text!
        let newString: NSString = currentString.stringByReplacingCharactersInRange(range, withString: string)
        return newString.length <= maxLength
    }
    
    @IBAction func ok(sender: UIButton) {
        
        if masterPasswordTextField.text != "" && masterPasswordTextField.text?.characters.count >= 4 {
            defaults.setObject(masterPasswordTextField.text, forKey: "masterKey")
            defaults.setObject(secretKeyTextField.text, forKey: "secretKey")
            let loginViewController = self.storyboard!.instantiateViewControllerWithIdentifier("login") as! LoginMasterPasswordViewController
            self.presentViewController(loginViewController, animated: true, completion: nil)
        }
        else if masterPasswordTextField.text == "" || reMasterPasswordTextField.text == "" {
            let alertView = UIAlertController(title: "Failed Input", message: "Please enter Master Password!", preferredStyle: .Alert)
            alertView.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            showViewController(alertView, sender: self)
        }
        else if reMasterPasswordTextField.text != masterPasswordTextField.text {
            let alertView = UIAlertController(title: "Failed Input", message: "Master Password your NOT SAME!", preferredStyle: .Alert)
            alertView.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            showViewController(alertView, sender: self)
        }
        else if secretKeyTextField.text == "" {
            let alertView = UIAlertController(title: "Failed Input", message: "Please enter SECRET KEY!", preferredStyle: .Alert)
            alertView.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            showViewController(alertView, sender: self)
        }  
        else {
            let alertView = UIAlertController(title: "Failed Input", message: "Please enter Master Password 4-8 digit", preferredStyle: .Alert)
            alertView.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            showViewController(alertView, sender: self)
        }
    }
}
