//
//  TopicsTableViewController.swift
//  CS392Project
//
//  Created by Burak Atalay on 27/11/14.
//  Copyright (c) 2014 Burak Atalay. All rights reserved.
//

import UIKit

class TopicsTableViewController: UITableViewController, XMLParserDelegate {
    
    var xmlParser : RSSParser!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSURL(string: "http://merlininkazani.com/rss.asp")
        xmlParser = RSSParser()
        xmlParser.delegate = self
        xmlParser.startParsingWithContentsOfURL(url!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func parsingWasFinished() {
        self.tableView.reloadData()
    }


    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
              return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
              return xmlParser.parsedDataArray.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("idCell", forIndexPath: indexPath) as UITableViewCell
    
    let currentDictionary = xmlParser.parsedDataArray[indexPath.row] as Dictionary<String, String>
    
    cell.textLabel?.text = currentDictionary["title"]
    
    return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let dictionary = xmlParser.parsedDataArray[indexPath.row] as Dictionary<String, String>
        let tutorialLink = dictionary["link"]
        
        let secondViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("idSecondViewController") as SecondViewController
        
        secondViewController.rssURL = NSURL(string: tutorialLink!)
        
        showDetailViewController(secondViewController, sender: self)

    }
    
}
