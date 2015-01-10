//
//  Feed.swift
//  CS392Project
//
//  Created by Burak Atalay on 29/12/14.
//  Copyright (c) 2014 Burak Atalay. All rights reserved.
//

import Foundation

class Feed {
    let displayName: String
    let url: String
    
    init(displayName: String, url: String) {
        self.displayName = displayName
        self.url = url
    }
    
    func createDictionary() -> NSDictionary {
        return ["displayName": self.displayName as String, "url": self.url as String]
    }
}