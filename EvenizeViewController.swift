//
//  EvenizeViewController.swift
//  TipCalc
//
//  Created by Christine Munar on 2/17/16.
//  Copyright © 2016 Christine Munar. All rights reserved.
//

import UIKit

class EvenizeViewController: UIViewController {
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var totalAmount: UILabel!
    @IBOutlet weak var tipPercent: UILabel!
    @IBOutlet weak var tipAmount: UILabel!
    
    
    var currentAmount = Double()
    
    var totalAmountLabel = String()
    var tipPercentLabel = String()
    var tipAmountLabel = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = false
        totalAmount.text = totalAmountLabel
        tipPercent.text = tipPercentLabel
        tipAmount.text = tipAmountLabel
        
        slider.minimumTrackTintColor = UIColor.greenColor()
        
    }

    override func viewWillDisappear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
    }

    @IBAction func valueChanged(sender: AnyObject) {
        let sliderVal = slider.value
        let sliderAmount:Double = round(currentAmount + (currentAmount * Double(sliderVal)))
        totalAmount.text = "$"+String(format: "%.2f",sliderAmount)
        
        let sliderTipAmount:Double = sliderAmount - currentAmount
        tipAmount.text = "$"+String(format: "%.2f",sliderTipAmount)
        
        let sliderTipPercent:Double = ((sliderAmount - currentAmount)/currentAmount) * 100
        tipPercent.text = String(format: "%.1f", sliderTipPercent) + "%"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
