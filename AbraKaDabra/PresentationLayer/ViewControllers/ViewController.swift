//
//  ViewController.swift
//  AbraKaDabra
//
//  Created by Isha Srivastava on 04/06/15.
//  Copyright (c) 2015 IBM. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate , UITableViewDataSource {

    // MARK: Global Variables
    var nameView : NameDetailView!
    var selected : Bool!
    var nameOfRows : [String]!
    var cell : UITableViewCell!
    var index : Int!
    // MARK: outlets
    var nameLabel : UILabel!
    var rowImage : UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: View functions
    override func viewDidLoad() {
        super.viewDidLoad()
        selected = false
        index = 100
        nameOfRows = ["Name", "DOB", "City"]
        tableView.registerNib(UINib(nibName: "NameView", bundle: nil), forCellReuseIdentifier: "cellIdentifier")
        
       // nameView = NameDetailView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: TableViewDelegate Functions
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameOfRows.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if selected == false
        {
            cell = tableView.dequeueReusableCellWithIdentifier("defaultIdentifier", forIndexPath: indexPath) as! UITableViewCell
            nameLabel = cell.viewWithTag(101) as! UILabel
            rowImage = cell.viewWithTag(102) as! UIImageView
            nameLabel.text = nameOfRows[indexPath.row]
            rowImage.image = UIImage(named: "DeselectedRow.png")
            return cell
        }
        else
        {
            if indexPath.row != index
            {
                cell = tableView.dequeueReusableCellWithIdentifier("defaultIdentifier", forIndexPath: indexPath) as! UITableViewCell
                println(index)
                println(indexPath.row)
                nameLabel.text = nameOfRows[indexPath.row]
                rowImage.image = UIImage(named: "DeselectedRow.png")
                return cell
            }
        }
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selected = true
        index = indexPath.row
       cell = tableView.dequeueReusableCellWithIdentifier("cellIdentifier", forIndexPath: indexPath) as! NameDetailView
        
        tableView.reloadData()
    }
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        selected = false
        index = indexPath.row
        cell = tableView.dequeueReusableCellWithIdentifier("defaultIdentifier", forIndexPath: indexPath) as! NameDetailView
        tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == index
        {
            return 170
        }
        else
        {
            return 50
        }
    }
}

