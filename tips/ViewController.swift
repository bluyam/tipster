//
//  ViewController.swift
//  tips
//
//  Created by Kyle Wilson on 12/1/15.
//  Copyright (c) 2015 Bluyam Inc. All rights reserved.
//
// Notes from video:
// 1) Build Layout
// 2) Tie in Events
// Outlets: Name view elements in code
// Actions: Tie in to event

import UIKit

class ViewController: UIViewController {

    @IBOutlet var billField: UITextField!
    @IBOutlet var tipLabel: UILabel!
    @IBOutlet var totalLabel: UILabel!
    @IBOutlet var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        
        totalLabel.numberOfLines = 1;
        totalLabel.minimumScaleFactor = 8;
        totalLabel.adjustsFontSizeToFitWidth = true;
        
        var tipPercentages = [0.10, 0.15, 0.2, 0.25]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        var billAmount = billField.text._bridgeToObjectiveC().doubleValue
        var tip =  billAmount * tipPercentage
        var total = billAmount + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

}
