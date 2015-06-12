//: Playground - noun: a place where people can play

import UIKit

var parser = NSXMLParser()
var posts = NSMutableArray()
var elements = NSMutableDictionary()
var element = NSString()
var title1 = NSMutableString()
var date = NSMutableString()

func beginParsing()
{
    posts = []
    parser = NSXMLParser(contentsOfURL: (NSURL.(String:"http://images.apple.com/main/rss/hotnews/hotnews.rss")))!
    parser.delegate = self
    parser.parse()
    tbData!.reloadData()
}