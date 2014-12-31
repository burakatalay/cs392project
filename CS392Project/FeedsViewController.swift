//
//  FeedsViewController.swift
//  CS392Project
//
//  Created by Burak Atalay on 29/12/14.
//  Copyright (c) 2014 Burak Atalay. All rights reserved.
//

import Foundation
import UIKit

class FeedsViewController: UITableViewController {
    var feed: Feed!
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("FeedCell") as UITableViewCell
        let rssFeed = feed.feeds[indexPath.item]
        cell.textLabel?.text = rssFeed.displayName
        cell.detailTextLabel?.text = rssFeed.url
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let userDefaults = NSUserDefaults.standardUserDefaults()
       
        
    }
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            var index = indexPath.item
            feed.deleteMember(index)
            self.tableView.reloadData()
            saveInformation()
        }
    }
    
    func saveInformation() {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setObject(feed?.convertToDictionary(), forKey: "feed")
    }
}
