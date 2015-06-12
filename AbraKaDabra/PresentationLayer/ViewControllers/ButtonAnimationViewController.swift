//
//  ButtonAnimationViewController.swift
//  AbraKaDabra
//
//  Created by MOHIT MANGLA on 08/06/15.
//  Copyright (c) 2015 IBM. All rights reserved.
//

import UIKit

class ButtonAnimationViewController: UIViewController{
    
    // MARK: variables
    var buttons : [UIButton]!
    var basketButton : UIButton!
    var i : CGFloat = 0
    
    // MARK: IBOutlets
    @IBOutlet var label: UILabel!
    @IBOutlet var noOfButtonsText: UITextField!
    
    
    // MARK: View
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.hidden = true
        
        basketButton = UIButton(frame: CGRectMake(self.view.frame.width/2 - 50, self.view.frame.height - 110, 100, 100))
        basketButton.setImage(UIImage(named: "basket.png"), forState: UIControlState.Normal)
        basketButton.addTarget(self, action: "basketButtonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
        
        buttons = [UIButton]()
        view.addSubview(basketButton)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBar.hidden = true
    }
    
    // MARK: Create buttons
    
    func createButton(noOfButtons: Int)
    {
        for (var i = 0 ; i < noOfButtons ; i++)
        {
            if (buttons.count <= noOfButtons)
            {
            var button = UIButton(frame: CGRectMake(self.view.frame.width/2 - 50, self.view.frame.height - 110, 100, 100))
            button.setImage(UIImage(named: "basket.png"), forState: UIControlState.Normal)
            button.addTarget(self, action: "buttonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
            view.addSubview(button)
            buttons.append(button)
            }
        }
        self.view.addSubview(basketButton)
    }
    
    func basketButtonClicked(sender: UIButton)
    {
        i = 0
        
        var padding: CGFloat = 10
        if (noOfButtonsText.text  == "")
        {
            var alert = UIAlertView(title: "Error", message: "Please enter number of buttons", delegate: nil, cancelButtonTitle: "Cancel")
            alert.show()
        }
        else
        {
            if (noOfButtonsText.text.toInt()! % 2 == 0 && noOfButtonsText.text.toInt()! <= 8)
            {
                self.basketButton.removeFromSuperview()
                createButton(noOfButtonsText.text.toInt()!)
                self.changeButtonFrameWithAnimation(1)
                label.hidden = true
                noOfButtonsText.hidden = true
            }
            else
            {
                var alert = UIAlertView(title: "Error", message: "Max - 8 and Even only", delegate: nil, cancelButtonTitle: "Cancel")
                alert.show()
            }
        }
        
    }
    
    
    
    func changeButtonFrameWithAnimation(oddButton : Int)
    {
        var padding: CGFloat = 10
        
        if oddButton <= buttons.count-1
        {
            UIView.animateWithDuration(1, animations: { () -> Void in
                self.buttons[oddButton - 1].frame = CGRectMake(self.view.frame.width/2 - 50, (self.view.frame.origin.y + padding * self.i + self.buttons[oddButton - 1].frame.size.height * self.i) + padding , 100, 100)
                }, completion: { (var abc) -> Void in
                    UIView.animateWithDuration(1, animations: { () -> Void in
                        self.buttons[oddButton - 1].frame = CGRectMake(padding, (self.view.frame.origin.y + padding * self.i + self.buttons[oddButton - 1].frame.size.height * self.i) + padding , 100, 100)
                    })
                    
            })

        
        UIView.animateWithDuration(1.5, animations: { () -> Void in
            self.buttons[oddButton].frame = CGRectMake(self.view.frame.width/2 - 50, (self.view.frame.origin.y + padding * self.i + self.buttons[oddButton - 1].frame.size.height * self.i) + padding , 100, 100)
            }, completion: { (var abc) -> Void in
                UIView.animateWithDuration(1, animations: { () -> Void in
                    self.buttons[oddButton].frame = CGRectMake(self.view.frame.width - padding - 100, (self.view.frame.origin.y + padding * self.i + self.buttons[oddButton - 1].frame.size.height * self.i) + padding , 100, 100)
                }, completion: { (var abc) -> Void in
                    self.i = self.i+1
                    self.changeButtonFrameWithAnimation(oddButton+2)
                })
                
        })
        }
     
    }
    
    func buttonClicked(sender: UIButton)
    {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil);
        let secondViewController = storyboard?.instantiateViewControllerWithIdentifier("table") as! TableViewController
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
    
    

    
}


