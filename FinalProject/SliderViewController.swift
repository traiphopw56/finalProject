//
//  ViewController.swift
//  FinalProject
//
//  Created by student on 11/17/2558 BE.
//  Copyright © 2558 student. All rights reserved.
//

import UIKit

class SliderViewController: UIViewController {

    @IBOutlet var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let sliderButtonImage = UIImage(named: "Lock")
        slider.setThumbImage(sliderButtonImage, forState: .Normal)
    }

    
    @IBAction func valueChanged(sender: UISlider) {
        let register = RegisterViewController()
        let masterKey = register.defaults.stringForKey("masterKey")
        
        
        if Int(sender.value) == 1 && masterKey != nil {
            let loginViewController = self.storyboard!.instantiateViewControllerWithIdentifier("login") as! LoginMasterPasswordViewController
            self.presentViewController(loginViewController, animated: true, completion: nil)
        }
        
        
        if Int(sender.value) == 1 && masterKey == nil {
            let registerViewController = self.storyboard!.instantiateViewControllerWithIdentifier("register") as! RegisterViewController
            self.presentViewController(registerViewController, animated: true, completion: nil)
        }
    }
    
    

}

