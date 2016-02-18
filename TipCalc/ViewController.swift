//
//  ViewController.swift
//  TipCalc
//
//  Created by Christine Munar on 2/13/16.
//  Copyright © 2016 Christine Munar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainTextField: UITextField!
    @IBOutlet weak var tenPercentLabel: UILabel!
    @IBOutlet weak var fifteenPercentLabel: UILabel!
    @IBOutlet weak var twentyPercentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = false
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func calculatePressed(sender: AnyObject) {
        let amount:Double = Double(mainTextField.text!)!
        let tenPercentOfAmount:Double = (round(100*(amount * 0.1))/100)
        let fifteenPercentOfAmount:Double = (round(100*(amount*0.15))/100)
        let twentyPercentOfAmount:Double = (round(100*(amount*0.2))/100)
        
        tenPercentLabel.text = "$"+String(format: "%.2f",tenPercentOfAmount)
        fifteenPercentLabel.text = "$"+String(format: "%.2f",fifteenPercentOfAmount)
        twentyPercentLabel.text = "$"+String(format: "%.2f",twentyPercentOfAmount)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destViewController : EvenizeViewController = segue.destinationViewController as! EvenizeViewController
        
        let amount:Double = Double(mainTextField.text!)!
        destViewController.currentAmount = amount
        
        let initialTotal:Double = round(amount + (amount*0.085))
        destViewController.totalAmountLabel = "$"+String(format: "%.2f",initialTotal)
        
        let initialTipAmount:Double = initialTotal - amount
        destViewController.tipAmountLabel = "$"+String(format: "%.2f",initialTipAmount)
        
        let initialTipPercent:Double = ((initialTotal - amount)/amount) * 100
        destViewController.tipPercentLabel = String(format: "%.1f", initialTipPercent) + "%"
        
    }


}

