//
//  TableViewClass.swift
//  LearningProject
//
//  Created by MOHIT MANGLA on 22/04/15.
//  Copyright (c) 2015 MOHIT MANGLA. All rights reserved.
//

import UIKit

class TableViewClass: UIView, UITableViewDelegate, UITableViewDataSource {
    
    var tableViewInstance : UITableView!
    var isSelected : [Bool]!
    var rowname : NSArray = NSArray()
    var nameLabel : UILabel!
    var firstName : UITextField!
    var middleName : UITextField!
    var lastName : UITextField!
    var cellTemp : UITableViewCell!
    
    
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        isSelected  = [false,false,false]
        
        tableViewInstance = UITableView(frame: CGRectMake(0, 0, frame.width, frame.height))
        tableViewInstance.userInteractionEnabled = true;
        tableViewInstance.registerClass(UITableViewCell.self, forCellReuseIdentifier: "CustomTableViewCell")
        tableViewInstance.delegate = self;
        tableViewInstance.dataSource = self;
        self.addSubview(tableViewInstance)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return rowname.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("CustomTableViewCell", forIndexPath: indexPath) as! UITableViewCell
        cell.textLabel?.text = rowname[indexPath.row] as! String
        
        //cell = tableView.cellForRowAtIndexPath(indexPath) as UITableViewCell?
        if indexPath.row == 0
        {
            firstName = UITextField(frame: CGRectMake(cell.frame.width, 45, cell.frame.width, 30))
            firstName.layer.borderWidth = 0.5
            firstName.layer.borderColor = UIColor.blueColor().CGColor
            firstName.placeholder = " First Name"
            cell.addSubview(firstName)
            middleName = UITextField(frame: CGRectMake(cell.frame.width, 85, cell.frame.width, 30))
            middleName.layer.borderWidth = 0.5
            middleName.layer.borderColor = UIColor.blueColor().CGColor
            middleName.placeholder = " Middle Name"
            cell.addSubview(middleName)
            lastName = UITextField(frame: CGRectMake(cell.frame.width, 125, cell.frame.width, 30))
            lastName.layer.borderWidth = 0.5
            lastName.layer.borderColor = UIColor.blueColor().CGColor
            lastName.placeholder = " Last Name"
            cell.addSubview(lastName)
            //            nameLabel.text = firstName.text + middleName.text + lastName.text
            //            cell.addSubview(nameLabel)
            
            firstName.hidden = true
            middleName.hidden = true
            lastName.hidden = true
        }
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if isSelected[indexPath.row] == true
        {
            isSelected[indexPath.row] = false
            if(indexPath.row == 0)
            {firstName.hidden = false
                middleName.hidden = false
                lastName.hidden = false
                isSelected[indexPath.row] = true
                UIView.animateWithDuration(0.5, animations: { () -> Void in
                    self.firstName.frame = CGRectMake(self.cellTemp.frame.width, 45, self.cellTemp.frame.width, 30)
                    self.middleName.frame = CGRectMake(self.cellTemp.frame.width, 85, self.cellTemp.frame.width, 30)
                    self.lastName.frame = CGRectMake(self.cellTemp.frame.width, 125, self.cellTemp.frame.width, 30)
                })
            }
        }
        else{
            isSelected[indexPath.row] = true
            if(indexPath.row == 0)
            {firstName.hidden = false
                middleName.hidden = false
                lastName.hidden = false
                isSelected[indexPath.row] = true
                UIView.animateWithDuration(0.5, animations: { () -> Void in
                    cellTemp = tableView.cellForRowAtIndexPath(indexPath) as UITableViewCell?
                    self.firstName.frame = CGRectMake(8, 45, self.cellTemp!.frame.width, 30)
                    self.middleName.frame = CGRectMake(8, 85, self.cellTemp!.frame.width, 30)
                    self.lastName.frame = CGRectMake(8, 125, self.cellTemp!.frame.width, 30)
                })
            }
        }
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if isSelected[indexPath.row] == true
        {
            cellTemp = tableView.cellForRowAtIndexPath(indexPath) as UITableViewCell?
            return 160.0
        }
        else{
            return 54.0
        }
    }

    func setNameOfRows (nameOfRows: NSArray)
    {
        rowname  = nameOfRows
    }
}
