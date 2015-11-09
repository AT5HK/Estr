//
//  BusinessDetailViewController.swift
//  Estr
//
//  Created by auston salvana on 2015-11-07.
//  Copyright © 2015 ARJHack. All rights reserved.
//

import UIKit

class BusinessDetailViewController: UITableViewController {
    
    var masterArray = []
    var kTableHeaderHeight: CGFloat = 0.0
    
    @IBOutlet weak var headerBackground: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundView = UIImageView(image: UIImage(named: "backdrop"))
        ["title":"Phone number", "subTitle":"604-553-1232"]
        
        let firstSectionArray = [
            ["title":"Phone number", "subTitle":"604-553-1232"],
            ["title":"Address", "subTitle":"23423-234 way"],
            ["title":"Contact Info", "subTitle":"Amma Lyra"],
            ["title":"Website", "subTitle":"google.com"],
            ["title":"Hours", "subTitle":"9-5"],
            ["title":"Directions", "subTitle":"231 - 23rd"],
            ["title":"KMs away", "subTitle":"5km"]
        ]
        
        let secondSectionArray = [
            ["title":"Description", "subTitle":"this is the description blah blah blahblah blah blah"]
        ]
        
        masterArray = [firstSectionArray, secondSectionArray]
        parallaxViewSetup()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Helper methods 
    
    func parallaxViewSetup() {
        tableView.rowHeight = UITableViewAutomaticDimension
        kTableHeaderHeight = headerBackground.frame.size.height
        tableView.contentInset = UIEdgeInsetsMake(200, 0, 0, 0)
        updateHeaderView()
        tableView.tableHeaderView = nil
        tableView.addSubview(headerBackground)
    }
    
    func updateHeaderView () {
        // code to resize header
        var newImageFrame = self.headerBackground.frame
        newImageFrame.origin.y = -200
        self.headerBackground.frame = newImageFrame
        
        if (tableView.contentOffset.y < -kTableHeaderHeight) {
            var newImageHeightFrame = self.headerBackground.frame
            let newImageHeight = -tableView.contentOffset.y - kTableHeaderHeight
            let actualHeight = kTableHeaderHeight + newImageHeight
            newImageHeightFrame.size.height = actualHeight
            newImageHeightFrame.size.width = view.frame.size.width;
            let newY = newImageHeightFrame.origin.y - newImageHeight
            newImageHeightFrame.origin.y = newY
            
            self.headerBackground.frame = newImageHeightFrame
            
        }
        
    }
    
    //MARK: UIScrollViewDelegate 
    
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        updateHeaderView()
    }
    
    // MARK: - TableView DataSource
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return masterArray.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return masterArray[section].count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! BusinessDetailCell
        
        let section = masterArray[indexPath.section]
        let cellTitleText = section[indexPath.row]["title"] as! String
        let cellSubTitleText = section[indexPath.row]["subTitle"] as! String
        
        cell.cellTitle.text = cellTitleText
        cell.cellSubTitle.text = cellSubTitleText
        
        return cell
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
//    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
//        if editingStyle == .Delete {
//            objects.removeAtIndex(indexPath.row)
//            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
//        } else if editingStyle == .Insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
//        }
//    }
    
    //MARK - TableView Delegate
    
//    override func tableView(tableView: UITableView,
//        estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//            return 100
//    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }
    
    //MARK - Hide Status bar
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

}
