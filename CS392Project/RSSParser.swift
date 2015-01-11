//
//  RSSParser.swift
//  CS392Project
//
//  Created by Burak Atalay on 27/11/14.
//  Copyright (c) 2014 Burak Atalay. All rights reserved.
//

import UIKit

@objc protocol RSSParserDelegate{
    func finishedParsing()
}

class RSSParser: NSObject, NSXMLParserDelegate {
    
    var parsedDataArray = [[String:String]]()
    
    var currentDictionary = [String:String]()
    
    var currentElement = ""
    
    var foundCharacters = ""
    
    var delegate : RSSParserDelegate?
    
    
    func startParsingWithContentsOfURL(rssURL: NSURL) {
        let parser = NSXMLParser(contentsOfURL: rssURL)!
        parser.delegate = self
        parser.parse()
    }
    
    
    func parserDidEndDocument(parser: NSXMLParser) {
        delegate?.finishedParsing()
    }
    
    
    func parser(parser: NSXMLParser, didStartElement elementName: String!, namespaceURI: String!, qualifiedName qName: String!, attributes attributeDict: [NSObject : AnyObject]) {
        
        currentElement = elementName
    }
    
    
    func parser(parser: NSXMLParser, didEndElement elementName: String!, namespaceURI: String!, qualifiedName qName: String!) {
        if !foundCharacters.isEmpty {
            
            currentDictionary[currentElement] = foundCharacters
            
            foundCharacters = ""
            
            if currentElement == "pubDate" {
                parsedDataArray.append(currentDictionary)
            }
        }
    }
    
    
    func parser(parser: NSXMLParser, foundCharacters string: String!) {
        if currentElement == "title"  || currentElement == "link" || currentElement == "pubDate"{
            foundCharacters += string
        }
    }
}
