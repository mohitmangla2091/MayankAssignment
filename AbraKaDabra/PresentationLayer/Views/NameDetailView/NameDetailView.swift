//
//  NameDetailView.swift
//  AbraKaDabra
//
//  Created by Isha Srivastava on 04/06/15.
//  Copyright (c) 2015 IBM. All rights reserved.
//

import UIKit

class NameDetailView: UITableViewCell {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

    @IBOutlet weak var firstName: UITextField!
    
    @IBOutlet weak var middleName: UITextField!
    
    @IBOutlet weak var lastName: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    
    func combineName() -> String
    {
        println("\(firstName.text) \(middleName.text) \(lastName.text)")
        return ("\(firstName.text) \(middleName.text) \(lastName.text)")
        
    }
   
}
