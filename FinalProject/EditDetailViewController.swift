//
//  EditDetailViewController.swift
//  FinalProject
//
//  Created by student on 11/22/2558 BE.
//  Copyright © 2558 student. All rights reserved.
//

import UIKit

class EditDetailViewController: UIViewController {

    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var urlOrAppTextField: UITextField!
    var passwords = Password()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextField.text = passwords.username
        passwordTextField.text = passwords.password
        urlOrAppTextField.text = passwords.urlOrApp
    }
    
    @IBAction func saveAndClose(sender: UIButton) {
        DatabaseManager.updateContact(passwords.id, username: usernameTextField.text!, password: passwordTextField.text!, urlOrApp: urlOrAppTextField.text!)
        let detailViewController = self.storyboard!.instantiateViewControllerWithIdentifier("detail") as! DetailViewController
        self.presentViewController(detailViewController, animated: true, completion: nil)
    }

}
