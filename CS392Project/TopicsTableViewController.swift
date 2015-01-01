//
//  TopicsTableViewController.swift
//  CS392Project
//
//  Created by Burak Atalay on 27/11/14.
//  Copyright (c) 2014 Burak Atalay. All rights reserved.
//

import UIKit

class TopicsTableViewController: UITableViewController  {
    var feed: [Feed]!
    
    
    
    @IBOutlet weak var feedTableView: UITableView!
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("FeedCell") as UITableViewCell
        let rssFeed = feed[indexPath.item]
        cell.textLabel?.text = rssFeed.displayName
        cell.detailTextLabel?.text = rssFeed.url
        return cell
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feed.count
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        feed = [Feed]()
        let userDefaults = NSUserDefaults.standardUserDefaults()
    }
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            var index = indexPath.item
            feed.removeAtIndex(index)
            self.tableView.reloadData()
            //saveInformation()
        }
    }
    /* Yeniden düzenlemelisin
    func saveInformation() {
    let userDefaults = NSUserDefaults.standardUserDefaults()
    userDefaults.setObject(feed.convertToDictionary(), forKey: "feed")
    }
    
    */
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showFeed" {
            let showFeedVC = segue.destinationViewController as SecondViewController
            showFeedVC.showFeedsVC = showFeedVC
        } else {
            let addFeedVC = segue.destinationViewController as addFeedViewController
            addFeedVC.feedsVC = self
        }
    }
    
}
