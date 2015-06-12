//
//  TableViewController.swift
//  AbraKaDabra
//
//  Created by Isha Srivastava on 04/06/15.
//  Copyright (c) 2015 IBM. All rights reserved.
//

import UIKit

class TableViewController:UIViewController  {

    var tableViewIns:TableViewClass!
    var nameOfRows = ["Name","DOB","country"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewIns =  TableViewClass(frame: CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height))
        self.navigationController?.navigationBar.hidden = false
        self.view.addSubview(tableViewIns)
        tableViewIns.setNameOfRows(nameOfRows)
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

//    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        // #warning Potentially incomplete method implementation.
//        // Return the number of sections.
//        return 1
//    }
//
//    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete method implementation.
//        // Return the number of rows in the section.
//        return rowname.count
//    }
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCellWithIdentifier("defaultIdentifier", forIndexPath: indexPath) as! UITableViewCell
//        nameLabel = cell.viewWithTag(101) as! UILabel
//        nameLabel.text = rowname[indexPath.row] as? String
//        
//        //cell = tableView.cellForRowAtIndexPath(indexPath) as UITableViewCell?
//        if indexPath.row == 0
//        {
//        firstName = UITextField(frame: CGRectMake(cell.frame.width, 45, cell.frame.width, 30))
//        firstName.layer.borderWidth = 0.5
//        firstName.layer.borderColor = UIColor.blueColor().CGColor
//        firstName.placeholder = " First Name"
//        cell.addSubview(firstName)
//        middleName = UITextField(frame: CGRectMake(cell.frame.width, 85, cell.frame.width, 30))
//        middleName.layer.borderWidth = 0.5
//        middleName.layer.borderColor = UIColor.blueColor().CGColor
//        middleName.placeholder = " Middle Name"
//        cell.addSubview(middleName)
//        lastName = UITextField(frame: CGRectMake(cell.frame.width, 125, cell.frame.width, 30))
//        lastName.layer.borderWidth = 0.5
//        lastName.layer.borderColor = UIColor.blueColor().CGColor
//        lastName.placeholder = " Last Name"
//         cell.addSubview(lastName)
////            nameLabel.text = firstName.text + middleName.text + lastName.text
////            cell.addSubview(nameLabel)
//            
//            firstName.hidden = true
//            middleName.hidden = true
//            lastName.hidden = true
//        }
//        return cell
//    }
//    
//    
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        var cellTemp : UITableViewCell!
//        if(indexPath.row == 0)
//        {firstName.hidden = false
//            middleName.hidden = false
//            lastName.hidden = false
//            isSelected[indexPath.row] = true
//            cellTemp = tableView.cellForRowAtIndexPath(indexPath) as UITableViewCell?
//            UIView.animateWithDuration(0.5, animations: { () -> Void in
//                self.firstName.frame = CGRectMake(8, 45, cellTemp!.frame.width, 30)
//                self.middleName.frame = CGRectMake(8, 85, cellTemp!.frame.width, 30)
//                self.lastName.frame = CGRectMake(8, 125, cellTemp!.frame.width, 30)
//            })
//        }
//        
//        
//        
//        
//        tableView.beginUpdates()
//        tableView.endUpdates()
//    }
//    
//
//     func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        
//        var height : CGFloat = 54.0
//        if isSelected[indexPath.row] == true
//        {
//            height = 160.0
//            
//        }
//        else{
//        height =  54.0;
//        }
//        return height
//    }
}
