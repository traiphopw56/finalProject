//
//  DetailTableViewCell.swift
//  FinalProject
//
//  Created by student on 11/22/2558 BE.
//  Copyright © 2558 student. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    
    @IBOutlet var iconImageView: UIImageView!
    @IBOutlet var usernameLabel: UILabel!
    @IBOutlet var passwordLabel: UILabel!
    @IBOutlet var urlOrAppLabel: UILabel!

    func setDetailCell(password: Password){
        iconImageView.image = UIImage(named: password.imageName)
        usernameLabel.text = " " + password.username
        passwordLabel.text = " " + countStar(password.password.characters.count)
        urlOrAppLabel.text = " " + password.urlOrApp
    }
    
    func countStar(countChar: Int) -> String{
        var str = ""
        for _ in 0..<countChar {
            str += "*"
        }
        return str
    }

}
