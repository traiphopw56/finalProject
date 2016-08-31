//
//  AddDetailViewController.swift
//  FinalProject
//
//  Created by student on 11/22/2558 BE.
//  Copyright © 2558 student. All rights reserved.
//

import UIKit

class AddDetailViewController: UIViewController {
    
    var passwords = Password()
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var urlOrAppTextField: UITextField!
    @IBOutlet var segment: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        passwords.imageName = "social.png" //default
    }
    
    @IBAction func chooseType(sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 /* Social */ {
            passwords.imageName = "social.png"
        }
        else if sender.selectedSegmentIndex == 1 /* Email */ {
            passwords.imageName = "email.png"
        }
        else if sender.selectedSegmentIndex == 2 /* App */ {
            passwords.imageName = "application.png"
        }
        else if sender.selectedSegmentIndex == 3 /* Game */ {
            passwords.imageName = "game.png"
        }
        else /* General */ {
            passwords.imageName = "general.png"
        }
    }
    
    @IBAction func saveAndClose(){
        if usernameTextField.text == "" {
            let alertView = UIAlertController(title: "Failed Input", message: "Please input your USERNAME !", preferredStyle: .Alert)
            alertView.addAction(UIAlertAction(title: "Close", style: .Default, handler: nil))
            showViewController(alertView, sender: self)
        }
        else if passwordTextField.text == "" {
            let alertView = UIAlertController(title: "Failed Input", message: "Please input your PASSWORD !", preferredStyle: .Alert)
            alertView.addAction(UIAlertAction(title: "Close", style: .Default, handler: nil))
            showViewController(alertView, sender: self)
        }
        else if urlOrAppTextField.text == "" {
            let alertView = UIAlertController(title: "Failed Input", message: "Please input your URL or Application Name !", preferredStyle: .Alert)
            alertView.addAction(UIAlertAction(title: "Close", style: .Default, handler: nil))
            showViewController(alertView, sender: self)
        } 
        else {
            DatabaseManager.addPassword(usernameTextField.text!, password: passwordTextField.text!, urlOrApp: urlOrAppTextField.text! , imageName: passwords.imageName)
            let detailViewController = self.storyboard!.instantiateViewControllerWithIdentifier("detail") as! DetailViewController
            self.presentViewController(detailViewController, animated: true, completion: nil)
        }
    }

}
