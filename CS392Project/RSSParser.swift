//
//  RSSParser.swift
//  CS392Project
//
//  Created by Burak Atalay on 27/11/14.
//  Copyright (c) 2014 Burak Atalay. All rights reserved.
//

import UIKit
import Foundation


@objc protocol XMLParserDelegate{
    func parsingWasFinished()
}

class RSSParser: NSObject, NSXMLParserDelegate {
    
    var delegate : XMLParserDelegate?
    
    var parsedDataArray = [Dictionary<String, String>]()
    
    var dataDictionary = Dictionary<String, String>()
    
    var currentElement = ""
    
    var foundCharacters = ""
    
    func startParsingURL(rssURL: NSURL) {
        let parser = NSXMLParser(contentsOfURL: rssURL)!
        parser.delegate = self
        parser.parse()
    }
    
    func parser(parser: NSXMLParser, didStartElement elementName: String!, namespaceURI: String!, qualifiedName qName: String!, attributes attributeDict: [NSObject : AnyObject]) {
        
        currentElement = elementName
    }
    
    func parser(parser: NSXMLParser, foundCharacters string: String!) {
        if (currentElement == "title"  || currentElement == "link" ){
            foundCharacters += string
        }
    }
    
   
    
    
    func parserDidEndDocument(parser: NSXMLParser) {
        delegate?.parsingWasFinished()
    }
    
    func parser(parser: NSXMLParser, parseErrorOccurred parseError: NSError!) {
        println(parseError.description)
    }
    
    
    func parser(parser: NSXMLParser, validationErrorOccurred validationError: NSError!) {
        println(validationError.description)
    }
}
