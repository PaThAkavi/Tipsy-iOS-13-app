//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    var percentage: Float?
    var finalBill: Float?
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!

    @IBAction func tipChanged(_ sender: UIButton) {
        
        billTextField.endEditing(true) //to abord the keyboard when tip selected
        tenPctButton.isSelected = false
        tenPctButton = sender
        sender.isSelected = true
        let perc = Float(sender.currentTitle!.dropLast())
        percentage = perc
//        print(perc!/100)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = Int(sender.value).description
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let billValue = Float(billTextField.text!)!
        let tip = ((percentage!)/100)*billValue
        let bill = tip + billValue
        let splits = Float(splitNumberLabel.text!)!
        let billPerPerson = bill/splits
        finalBill = billPerPerson
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.billSplit = finalBill
            destinationVC.people = Int(splitNumberLabel.text ?? "2")
            destinationVC.tipPercentage = percentage
        }
        
        
    }

}

