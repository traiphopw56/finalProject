//
//  Password.swift
//  FinalProject
//
//  Created by student on 11/22/2558 BE.
//  Copyright © 2558 student. All rights reserved.
//

import Foundation
import RealmSwift

class Password: Object {
    
    dynamic var id = 0
    dynamic var username: String = ""
    dynamic var password: String = ""
    dynamic var urlOrApp: String = ""
    dynamic var imageName: String = ""
    
    override static func primaryKey() -> String {
        return "id"
    }
    
    convenience init(username: String, password: String, urlOrApp: String, imageName: String) {
        self.init()
        self.username = username
        self.password = password
        self.urlOrApp = urlOrApp
        self.imageName = imageName
    }
}
