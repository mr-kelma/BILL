//
//  CalculatorViewController.swift
//  BILL
//
//  Created by Valery Keplin on 14.06.22.
//

import UIKit

class CalculatorViewController: UIViewController {

    var tip = 0.10
    var people = 2.0
    var totalBill = 0.0
    var totalResultString = ""
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var fivePctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var fifteenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    override var shouldAutorotate: Bool {
        return false
    }
    
    @IBAction func tipChaged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        fivePctButton.isSelected = false
        tenPctButton.isSelected = false
        fifteenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle ?? ""
        
        let buttonWithoutPercent = String(buttonTitle.dropLast())
        let buttonTitleNumber = Double(buttonWithoutPercent) ?? 10.0
        tip = buttonTitleNumber / 100
        }
    

    @IBAction func stepperValueChaged(_ sender: UIStepper) {
        billTextField.endEditing(true)
        
        people = sender.value
        splitNumberLabel.text = String(format: "%.0f", people)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        totalBill = Double(billTextField.text ?? "0.00") ?? 0.00
        let totalResultNumber = totalBill * (1 + tip) / people
        totalResultString = String(format: "%.0f", totalResultNumber)
        
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults"{
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.totalBill = billTextField.text ?? ""
            destinationVC.result = totalResultString
            destinationVC.people = Int(people)
            destinationVC.tip = Int(tip * 100)
        }
    }

}
