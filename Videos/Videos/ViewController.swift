//
//  ViewController.swift
//  Videos
//
//  Created by Alex on 27/05/2015.
//  Copyright (c) 2015 Alex. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, NSXMLParserDelegate
{
    let titles = [ String ]( arrayLiteral: "video", "id", "title", "location", "genre", "group", "episode", "season" )
    var videos = [Int: Video]()
    var element: String = ""
    var stringBuilder: String = ""
    var vId:Int = 0
    var vTitle: String = ""
    var vLocation: String = ""
    var vGenre: String = ""
    var vGroup: String = ""
    var vEpisode: Int = 0
    var vSeason: Int = 0
    var parser: NSXMLParser
    
    func beginparsing()
    {
        parser = NSXMLParser( contentsOfURL: NSURL(string: "http://www.whiteslife.com/database.php") )!
        parser.delegate = self
        parser.parse()
    }
    
    // start of element
    func parser( parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [NSObject : AnyObject] )
    {
        element = elementName
    }
    
    // string builder on element
    func parser(parser: NSXMLParser, foundCharacters string: String?)
    {
        switch element
        {
        case "id","title","location","genre","group","episode","season":
            stringBuilder += string!
        default:
            break
        }
    }
    
    // end of element
    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?)
    {
        switch element
        {
        case "video":
            let video = Video( id: vId, title: vTitle, location: vLocation, genre: vGenre, group: vGroup, episode: vEpisode, season: vSeason )
            videos[vId] = video
        case "id":
            vId = stringBuilder.toInt()!
        case "title":
            vTitle = stringBuilder
        case "location":
            vLocation = stringBuilder
        case "genre":
            vGenre = stringBuilder
        case "group":
            vGroup = stringBuilder
        case "episode":
            if count(stringBuilder) < 1
            {
                vEpisode = 0
            }
            else
            {
                vEpisode = stringBuilder.toInt()!
            }
        case "season":
            if count(stringBuilder) < 1
            {
                vSeason = 0
            }
            else
            {
                vSeason = stringBuilder.toInt()!
            }
        default:
            break
        }
        stringBuilder = ""
        element = ""
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

