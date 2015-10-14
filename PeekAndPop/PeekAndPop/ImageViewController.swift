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
    
    // MARK: Preview actions
    
    lazy var previewActions: [UIPreviewActionItem] = {
        func previewActionForTitle(title: String, style: UIPreviewActionStyle = .Default) -> UIPreviewAction {
            return UIPreviewAction(title: title, style: style) { previewAction, viewController in
                guard let detailViewController = viewController as? ImageViewController,
                    desc = detailViewController.text else { return }
                
                print("\(previewAction.title) triggered from `ImageViewController` with description: \(desc)")
            }
        }
        
        let action1 = previewActionForTitle("Default Action")
        let action2 = previewActionForTitle("Destructive Action", style: .Destructive)
        
        return [action1, action2]
        }()
    
    override func previewActionItems() -> [UIPreviewActionItem] {
        return previewActions
    }

}
