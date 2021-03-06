//
//  ArticleTableViewController.swift
//  TableCellAnimation
//
//  Created by Simon Ng on 18/11/14.
//  Copyright (c) 2014 AppCoda. All rights reserved.
//

import UIKit

class ArticleTableViewController: UITableViewController {
    
    let postTitles = ["Use Background Transfer Service To Download File in Background",
    "First Time App Developer Success Stories Part 1",
    "Adding Animated Effects to iOS App Using UIKit Dynamics",
    "Working with Game Center and Game Kit Framework",
    "How to Access iOS Calendar, Events and Reminders",
    "Creating Circular Profile Image"];
    
    let postImages = ["bts.jpg", "first-time-developer.jpg", "uidynamics.jpg", "gamecenter.jpg", "event-kit.jpg", "circular-image.jpg"];
    
    var postShown = [Bool](count: 6, repeatedValue: false)


    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return postTitles.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! ArticleTableViewCell

        // Configure the cell...
        cell.titleLabel.text = postTitles[indexPath.row]
        cell.postImageView.image = UIImage(named: postImages[indexPath.row])

        return cell
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        // Determine if the post is displayed. If yes, we just return and no animation will be created
        
        if postShown[indexPath.row] {
            
            return
        }
        
        // Indicate the post has been displayed, so the animation won't be displayed again
        
        postShown[indexPath.row] = true
        
        // define the initial state (before the animation)
        
        let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, -500, 100, 0)
        cell.layer.transform = rotationTransform
        
        // define the final state (after the animation)
        
        UIView.animateWithDuration(1.0, animations: { cell.layer.transform = CATransform3DIdentity })
    }
    

}
