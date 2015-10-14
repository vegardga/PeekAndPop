//
//  ImageViewController.swift
//  PeekAndPop
//
//  Created by Vegard Gamnes on 14.10.15.
//  Copyright © 2015 VegardGamnes. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myLabel: UILabel!
    
    var img: UIImage?
    var text: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myImageView.image = img
        myLabel.text = text
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
