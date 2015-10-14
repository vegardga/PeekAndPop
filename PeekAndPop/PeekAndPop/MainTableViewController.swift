//
//  MainTableViewController.swift
//  PeekAndPop
//
//  Created by Vegard Gamnes on 14.10.15.
//  Copyright © 2015 VegardGamnes. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    struct Asset {
        let title: String
        let img: String
    }
    
    let items = [
        Asset(title: "Triangle", img: ""),
        Asset(title: "Circle", img: ""),
        Asset(title: "Rectangle", img: ""),
        Asset(title: "Little house", img: "")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)

        let asset: Asset = items[indexPath.row]
        cell.textLabel!.text = asset.title
        print(asset.title)

        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
