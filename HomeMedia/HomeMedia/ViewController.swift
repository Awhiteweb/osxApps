//
//  ViewController.swift
//  HomeMedia
//
//  Created by Alex on 25/05/2015.
//  Copyright (c) 2015 Alex. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

		let cellDetails = [ ( "title 1", "Name 1" ), ( "title 2", "Name 2" ), ( "title 3", "Name 3" ) ]
    
    @IBAction func typeToggle(sender: AnyObject) {
    }
    
	 // UI Table
	 // data source: how many rows
	 // delegate: what happens when rows is touched
    
	 func numberOfSectionsInTableView(tableView: UITableView) -> Int
	 {
		return 1
	 }
	 
	 func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
	 {
		return cellDetails.count
	 }
	 
	 // needs a protoype cell in the table with identifier named cell
	 func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
	 {
			var cell = tableView.dequeueReusableCellWithIdentifier( "cell", forIndexPath: indexPath ) as UITableViewCell
			
			let ( title, author ) = cellDetails[ indexPath.row ]
			
			cell.textLabel?.text = title
			
			return cell
	 }
	 
	 func tableView( tableView: UITableView, titleForHeaderInSection section: Int) -> String?
	 {
		 return "Titles"
	 }
	 
    @IBAction func playBtn(sender: AnyObject) {
    }
    
    @IBAction func refreshBtn(sender: AnyObject) {
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

