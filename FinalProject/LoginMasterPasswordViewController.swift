//
//  LoginMasterPasswordViewController.swift
//  FinalProject
//
//  Created by student on 11/17/2558 BE.
//  Copyright © 2558 student. All rights reserved.
//

import UIKit

class LoginMasterPasswordViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var passwordTextField: UITextField!
    let defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextField.delegate = self
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 8
        let currentString: NSString = passwordTextField.text!
        let newString: NSString = currentString.stringByReplacingCharactersInRange(range, withString: string)
        return newString.length <= maxLength
    }
    
    @IBAction func login(sender: UIButton) {
        let register = RegisterViewController()
        let masterKey = register.defaults.stringForKey("masterKey")
        
        if passwordTextField.text == masterKey {
            let detailViewController = self.storyboard!.instantiateViewControllerWithIdentifier("detail") as! DetailViewController
            self.presentViewController(detailViewController, animated: true, completion: nil)
        }
        else {
            let alertView = UIAlertController(title: "Invalid Password", message: "Your Master Password is Incorrect", preferredStyle: .Alert)
            alertView.addAction(UIAlertAction(title: "Close", style: .Default, handler: nil))
            showViewController(alertView, sender: self)
        }
    }
}
