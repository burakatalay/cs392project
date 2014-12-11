//
//  SecondViewController.swift
//  CS392Project
//
//  Created by Burak Atalay on 27/11/14.
//  Copyright (c) 2014 Burak Atalay. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var toolBar: UIToolbar!
    @IBOutlet weak var barButton: UIBarButtonItem!
    
    var rssURL : NSURL!
    
    
    @IBAction func publishButtonClicked(sender: AnyObject) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.hidden = true
        toolBar.hidden = true
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if rssURL != nil {
            let request : NSURLRequest = NSURLRequest(URL: rssURL)
            webView.loadRequest(request)
            
            if webView.hidden {
                webView.hidden = false
                toolBar.hidden = false
            }
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
