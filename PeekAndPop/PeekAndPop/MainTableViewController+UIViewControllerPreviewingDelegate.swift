//
//  MainTableViewController+UIViewControllerPreviewingDelegate.swift
//  PeekAndPop
//
//  Created by Vegard Gamnes on 14.10.15.
//  Copyright © 2015 VegardGamnes. All rights reserved.
//

import UIKit

extension MainTableViewController: UIViewControllerPreviewingDelegate {
    
    // MARK: UIViewControllerPreviewingDelegate
    
    func previewingContext(previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        guard let indexPath = tableView.indexPathForRowAtPoint(location),
            cell = tableView.cellForRowAtIndexPath(indexPath) else { return nil }
        
        guard let detailViewController = storyboard?.instantiateViewControllerWithIdentifier("ImageViewController") as? ImageViewController else { return nil }
        
        let asset = items[indexPath.row]
        detailViewController.title = asset.title
        detailViewController.img = UIImage(named: asset.img)
        detailViewController.text = asset.desc
        
        previewingContext.sourceRect = cell.frame
        
        return detailViewController
    }
    
    func previewingContext(previewingContext: UIViewControllerPreviewing, commitViewController viewControllerToCommit: UIViewController) {
        showViewController(viewControllerToCommit, sender: self)
    }
    
}
