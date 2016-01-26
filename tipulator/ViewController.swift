//
//  ViewController.swift
//  tipulator
//
//  Created by Bobby Smith on 1/25/16.
//  Copyright © 2016 Bobby Smith. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipStepperLabel: UILabel!
    
    @IBOutlet weak var stepper: UIStepper!
    
    
    @IBAction func stepperValueChanged(sender: AnyObject) {
        tipStepperLabel.text = Int(stepper.value).description
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // initialize values
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        tipStepperLabel.text = Int(stepper.value).description
        
    }
    
    @IBAction func changeAmount(sender: AnyObject) {
        
        // grab value from stepper and turn in to a decimal/percent
        let tipPercentage = Double(stepper.value) / 100
        var tip:Double = 0
        var total:Double = 0
        
        // grab bill amount
        let billAmount = Double(billField.text!)

        // don't crash on nil
        if (billAmount != nil) {
            // calculate tip
            tip = billAmount! * tipPercentage
            // calculate total bill
            total = billAmount! + tip
        }
        
        // write to screen
        tipLabel.text = "\(tip.asLocaleCurrency)"
        totalLabel.text = "\(total.asLocaleCurrency)"
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension Double {
    // set double to local currency string
    var asLocaleCurrency:String {
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .CurrencyStyle
        formatter.locale = NSLocale.currentLocale()
        return formatter.stringFromNumber(self)!
    }

}