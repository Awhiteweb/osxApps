//
//  ViewController.swift
//  Videos
//
//  Created by Alex on 27/05/2015.
//  Copyright (c) 2015 Alex. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource
{
    
    let titles = [ ("title 1","description 1"), ("title 2","description 2") ]

    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return titles.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier( "cell", forIndexPath: indexPath ) as! UITableViewCell

        
        let ( title, desc ) = titles[indexPath.row]
        
        cell.textLabel?.text = title
        
        return cell
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

