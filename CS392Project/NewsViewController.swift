//
//  SecondViewController.swift
//  CS392Project
//
//  Created by Burak Atalay on 27/11/14.
//  Copyright (c) 2014 Burak Atalay. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController, UIPopoverPresentationControllerDelegate {
    var topicsVC: TitlesTableViewController!
    var secondVC: NewsViewController!
    
    
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var toolBar: UIToolbar!
    @IBOutlet weak var publishDateButton: UIBarButtonItem!
    
    
    var newsURL : NSURL!
    
    var publishDate : String!
    
    var newsButtonItem : UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.hidden = true
        toolBar.hidden = true
        
        newsButtonItem = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.Plain, target: self, action: "showTutorialsViewController")
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("handleFirstViewControllerDisplayModeChangeWithNotification:"), name: "DisplayModeChangeNotification", object: nil)
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if newsURL != nil {
            let request : NSURLRequest = NSURLRequest(URL: newsURL)
            webView.loadRequest(request)
            
            if webView.hidden {
                webView.hidden = false
                toolBar.hidden = false
            }
            
            
            if self.traitCollection.verticalSizeClass == UIUserInterfaceSizeClass.Compact{
                toolBar.items?.insert(self.splitViewController!.displayModeButtonItem(), atIndex: 0)
            }
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    deinit{
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    
    
    func showTutorialsViewController(){
        splitViewController?.preferredDisplayMode = UISplitViewControllerDisplayMode.AllVisible
    }
    
    
    func handleFirstViewControllerDisplayModeChangeWithNotification(notification: NSNotification){
        let displayModeObject = notification.object as? NSNumber
        let nextDisplayMode = displayModeObject?.integerValue
        
        if toolBar.items?.count == 3{
            toolBar.items?.removeAtIndex(0)
        }
        
        if nextDisplayMode == UISplitViewControllerDisplayMode.PrimaryHidden.rawValue {
            toolBar.items?.insert(newsButtonItem, atIndex: 0)
        }
        else{
            toolBar.items?.insert(splitViewController!.displayModeButtonItem(), atIndex: 0)
        }
    }
    
    
    
    
    
    
    @IBAction func showPublishDate(sender: AnyObject) {
        var popoverViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("idPopoverViewController") as? PopoverViewController
        
        popoverViewController?.modalPresentationStyle = UIModalPresentationStyle.Popover
        
        popoverViewController?.popoverPresentationController?.delegate = self
        
        self.presentViewController(popoverViewController!, animated: true, completion: nil)
        
        popoverViewController?.popoverPresentationController?.barButtonItem = publishDateButton
        popoverViewController?.popoverPresentationController?.permittedArrowDirections = .Any
        popoverViewController?.preferredContentSize = CGSizeMake(200.0, 80.0)
        
        popoverViewController?.label.text = "Publish Date:\n\(publishDate)"
        
    }
    
    
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.None
    }
    
}
