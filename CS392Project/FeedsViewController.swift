//
//  FeedsViewController.swift
//  CS392Project
//
//  Created by Burak Atalay on 09/01/15.
//  Copyright (c) 2015 Burak Atalay. All rights reserved.
//

import Foundation
import UIKit

class FeedsViewController: UITableViewController {
    var feed: [Feed]!
    
    
    
    @IBOutlet weak var feedsTableView: UITableView!
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("FeedCell") as UITableViewCell
        let rssFeed = feed[indexPath.item]
        cell.textLabel?.text = rssFeed.displayName
        
        return cell
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feed.count
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        feed = [Feed]()
        

    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            var index = indexPath.item
            feed.removeAtIndex(index)
            self.tableView.reloadData()
        }
    }
   
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showFeed" {
            
            
            let cell = sender as UITableViewCell
            let indexPath = tableView.indexPathForCell(cell)
            
            let showFeedVC = segue.destinationViewController as TitlesTableViewController
            showFeedVC.showFeedsVC = showFeedVC
            let rssFeed = feed[indexPath!.row]
            showFeedVC.url = rssFeed.url
            
        } else {
            let addFeedVC = segue.destinationViewController as addFeedViewController
            addFeedVC.feedsVC = self
        }
    }
   

}
