//
//  ShowDetailViewController.swift
//  FinalProject
//
//  Created by student on 11/24/2558 BE.
//  Copyright © 2558 student. All rights reserved.
//

import UIKit

class ShowDetailViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var usernameLabel: UILabel!
    @IBOutlet var passwordLabel: UILabel!
    @IBOutlet var urlOrAppLabel: UILabel!
    @IBOutlet var urlOrAppButton: UIButton!
    var passwords = Password()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: passwords.imageName)
        usernameLabel.text = passwords.username
        passwordLabel.text = passwords.password
        urlOrAppLabel.text = passwords.urlOrApp
        urlOrAppButton.setTitle(passwords.urlOrApp, forState: .Normal)
        
        if ((urlOrAppLabel.text!.hasSuffix(".com")) || (urlOrAppLabel.text!.hasSuffix(".th")) || (urlOrAppLabel.text!.hasSuffix(".org")) || (urlOrAppLabel.text!.hasPrefix("http")) || (urlOrAppLabel.text!.hasPrefix("https"))) && splitString(urlOrAppLabel.text!) != true{
            urlOrAppLabel.hidden = true
            urlOrAppButton.hidden = false
        }
        else {
            urlOrAppLabel.hidden = false
            urlOrAppButton.hidden = true
        }
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "openEdit" {
            let editDetailViewController = segue.destinationViewController as! EditDetailViewController
            editDetailViewController.passwords = passwords
        }
    }
    
    @IBAction func openLinkURL(sender: UIButton) {
        if var url = NSURL(string: "https://\(passwords.urlOrApp)") {
            if String(url).hasPrefix("https://http"){
                url = NSURL(string: "\(passwords.urlOrApp)")!
            }
            UIApplication.sharedApplication().openURL(url)
        }
    }
    
    func splitString(str: String) -> Bool{
        let strArray = str.componentsSeparatedByString("@")
        if strArray.count == 2 {
            return true
        }
        return false
    }

}
