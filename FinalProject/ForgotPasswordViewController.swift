//
//  ForgotPasswordViewController.swift
//  FinalProject
//
//  Created by student on 11/25/2558 BE.
//  Copyright © 2558 student. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    @IBOutlet var secretKeyTextField: UITextField!
    @IBOutlet var backBarButtonItem: UIBarButtonItem!
    let defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func recoveryPassword(sender: UIButton) {
        let register = RegisterViewController()
        let masterKey = register.defaults.stringForKey("masterKey")
        let secretKey  = register.defaults.stringForKey("secretKey")
        
        if secretKeyTextField.text == secretKey {
            let alertView = UIAlertController(title: "Your Password", message: masterKey, preferredStyle: .Alert)
            alertView.addAction(UIAlertAction(title: "OK", style: .Default, handler: { action in
                let loginMasterPasswordViewController = self.storyboard!.instantiateViewControllerWithIdentifier("login") as! LoginMasterPasswordViewController
                self.presentViewController(loginMasterPasswordViewController, animated: true, completion: nil)
            }))
            showViewController(alertView, sender: self)
        }
        else {
            let alertView = UIAlertController(title: "Error", message: "Invalid Secret Key, Try Again !!", preferredStyle: .Alert)
            alertView.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            showViewController(alertView, sender: self)
        }
    }
}
