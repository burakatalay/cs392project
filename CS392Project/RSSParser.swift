//
//  RSSParser.swift
//  CS392Project
//
//  Created by Burak Atalay on 27/11/14.
//  Copyright (c) 2014 Burak Atalay. All rights reserved.
//

import UIKit
import Foundation

class RSSParser: NSObject, NSXMLParserDelegate {
    
    
    
    func parseFile(filename: String) {
        var url = NSURL(string: "http://example.com/website-with-xml")
        var xmlParser = NSXMLParser(contentsOfURL: url)!
        xmlParser.delegate = self
        xmlParser.parse()
        }
    }
    
    
    func parserDidStartDocument(parser: NSXMLParser!) {
        
    }
    
    func parserDidEndDocument(parser: NSXMLParser!) {
        
    }
    
    func parser(parser: NSXMLParser!, didStartElement elementName: String!, namespaceURI: String!, qualifiedName qName: String!, attributes attributeDict: [NSObject : AnyObject]!) {
        
    }
    
    func parser(parser: NSXMLParser!, foundCharacters string: String!) {
        
    }
    
    func parser(parser: NSXMLParser!, didEndElement elementName: String!, namespaceURI: String!, qualifiedName qName: String!) {
        
    }
    
