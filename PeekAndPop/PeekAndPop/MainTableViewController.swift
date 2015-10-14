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
        let desc: String
    }
    
    let items = [
        Asset(title: "Triangle", img: "triangle", desc: "A polygon with three edges and three vertices"),
        Asset(title: "Circle", img: "circle", desc: "A simple shape in Euclidean geometry"),
        Asset(title: "Rectangle", img: "rectangle", desc: "Any quadrilateral with four right angles"),
        Asset(title: "Little house", img: "house", desc: "Little House on the Prairie?")
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

        return cell
    }

    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "Show Image", let indexPath = tableView.indexPathForSelectedRow {
            let asset = items[indexPath.row]
            let detailViewController = segue.destinationViewController as! ImageViewController
            
            detailViewController.title = asset.title
            detailViewController.img = UIImage(named: asset.img)
            detailViewController.text = asset.desc
        }
    }


}
