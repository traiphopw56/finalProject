//
//  DetailViewController.swift
//  FinalProject
//
//  Created by student on 11/19/2558 BE.
//  Copyright © 2558 student. All rights reserved.
//

import UIKit
import RealmSwift

class DetailViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet var navigationItemTitle: UINavigationItem!
    @IBOutlet var tableView: UITableView!
    var passwords: Results<Password>!
    let cellIdentifier = "Cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwords = DatabaseManager.getPasswords()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return passwords.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! DetailTableViewCell
        cell.setDetailCell(passwords[indexPath.row])
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            DatabaseManager.delContact(passwords[indexPath.row])
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "openDetail" {
            let showDetailViewController = segue.destinationViewController as! ShowDetailViewController
            let password = passwords[tableView.indexPathForSelectedRow!.row]
            showDetailViewController.passwords = password
        }
    }

    
}
