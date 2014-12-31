//
//  Feed.swift
//  CS392Project
//
//  Created by Burak Atalay on 29/12/14.
//  Copyright (c) 2014 Burak Atalay. All rights reserved.
//

import Foundation

class Feed {
    var feeds = [Feed]()
    
    let displayName: String
    let url: String
    
    init(displayName: String, url: String) {
        self.displayName = displayName
        self.url = url
    }
    
    func convertToDictionary() -> [String: String] {
        var dictionary = [String: String]()
        dictionary["displayName"] = displayName
        dictionary["url"] = url
        return dictionary
    }
    
    func addMember(member: Feed) {
        feeds.append(member)
    }
    
    func deleteMember(index: Int) {
        feeds.removeAtIndex(index)
    }


}