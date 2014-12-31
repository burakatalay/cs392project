//
//  addFeedViewController.swift
//  CS392Project
//
//  Created by Burak Atalay on 29/12/14.
//  Copyright (c) 2014 Burak Atalay. All rights reserved.
//

import Foundation
import UIKit

class addFeedViewController: UIViewController {
    var feed: Feed!
    
    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    
    @IBOutlet weak var displayName: UITextField!
    @IBOutlet weak var feedURL: UITextField!
    
    
    @IBAction func doneButtonTapped(sender: AnyObject) {
        feed.addMember(Feed(displayName: displayName.text, url: feedURL.text))
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func cancelButtonTapped(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    
    @IBAction func checkTextFields(sender: UITextField) {
        if displayName.text != "" && feedURL.text != "" {
            doneButton.enabled = true
        } else {
            doneButton.enabled = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        doneButton.enabled = false
    }
}