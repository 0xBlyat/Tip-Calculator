//
//  ViewController.swift
//  Tipsy
//
//  Created by Tony Alhwayek on 12/28/22.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet var billTextField: UITextField!
    @IBOutlet var zeroPctButton: UIButton!
    @IBOutlet var tenPctButton: UIButton!
    @IBOutlet var twentyPctButton: UIButton!
    @IBOutlet var splitNumberLabel: UILabel!
    
    var finalTotal: Float = 0.0
    var tipPercent: Float = 1.1
    
 
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        // Hide keyboard
        billTextField.endEditing(true)
        
        // Determine tip and which button to show as 'active'
        if(sender.currentTitle! == "0%") {
            tipPercent = 1.0
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
        } else if (sender.currentTitle! == "10%") {
            tipPercent = 1.1
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = true
            twentyPctButton.isSelected = false
        } else if (sender.currentTitle! == "20%") {
            tipPercent = 1.2
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
        }
    }
    

    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = Int(sender.value).description
        
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let billTotal: Float? = Float(billTextField.text!)
        
        if (billTotal != nil) {

            finalTotal = billTotal! * tipPercent
            finalTotal = finalTotal / Float(splitNumberLabel.text!)!
            
            print(String(format: "%.2f", finalTotal))
    
            // Move to ResultsViewController
            self.performSegue(withIdentifier: "goToTotal", sender: self)
            
        } else {
            // Present an alert if the user does not provide a bill total
            let alert = UIAlertController(title: "You entered an empty bill total", message: "Please enter a bill total", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("Retry", comment: "Default action"), style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToTotal" {
            let resultVC = segue.destination as! ResultsViewController
            
            resultVC.result = String(format: "%.2f", finalTotal)
            resultVC.tipPercentage = Int((tipPercent - 1) * 100)
            resultVC.numberOfPeople = Int(splitNumberLabel.text!)
        }
    }
    
}

