//
//  DatabaseManager.swift
//  FinalProject
//
//  Created by student on 11/22/2558 BE.
//  Copyright © 2558 student. All rights reserved.
//

import RealmSwift

class DatabaseManager {
    static func getPasswords() -> Results<Password> {
        let realm = try! Realm()
        return realm.objects(Password)
    }
    
    static func getPasswords(id: Int) -> Password?{
        let realm = try! Realm()
        return realm.objectForPrimaryKey(Password.self, key: id)
    }
    
    static func addPassword(username: String, password: String, urlOrApp: String, imageName: String){
        let realm = try! Realm()
        let passwords = Password()
        passwords.id = (realm.objects(Password).max("id") ?? 0) + 1
        passwords.username = username
        passwords.password = password
        passwords.urlOrApp = urlOrApp
        passwords.imageName = imageName
        try! realm.write {
            realm.add(passwords)
        }
    }
    
    static func delContact(password: Password){
        let realm = try! Realm()
        try! realm.write(){
            realm.delete(password)
        }
    }
    
    static func updateContact(id: Int, username: String, password: String, urlOrApp: String) {
        if let passwords = getPasswords(id) {
            let realm = try! Realm()
            try! realm.write {
                passwords.username = username
                passwords.password = password
                passwords.urlOrApp = urlOrApp
            }
        }
    }
}
