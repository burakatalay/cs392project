//
//  TopicsTableViewController.swift
//  CS392Project
//
//  Created by Burak Atalay on 27/11/14.
//  Copyright (c) 2014 Burak Atalay. All rights reserved.
//

import UIKit

class TopicsTableViewController: UITableViewController, RSSParserDelegate {
    var showFeedsVC: TopicsTableViewController!
    
    var rssParser : RSSParser!
    
    var feedsVC: FeedsViewController!
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSURL(string: "http://www.forbes.com/intelligent-technology/index.xml")
        rssParser = RSSParser()
        rssParser.delegate = self
        rssParser.startParsingWithContentsOfURL(url!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    func finishedParsing() {
        self.tableView.reloadData()
        
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rssParser.parsedDataArray.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("idCell", forIndexPath: indexPath) as UITableViewCell
        
        let currentDictionary = rssParser.parsedDataArray[indexPath.row] as Dictionary<String, String>
        
        
        cell.textLabel?.text = currentDictionary["title"]
        
        
        return cell
    }
    
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let dictionary = rssParser.parsedDataArray[indexPath.row] as Dictionary<String, String>
        let tutorialLink = dictionary["link"]
        let publishDateString = dictionary["pubDate"]
        
        let secondViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("idSecondViewController") as SecondViewController
        
        secondViewController.newsURL = NSURL(string: tutorialLink!)
        secondViewController.publishDate = publishDateString
        
        showDetailViewController(secondViewController, sender: self)
        
    }
}