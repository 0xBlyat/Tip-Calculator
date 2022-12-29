//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Tony Alhwayek on 12/28/22.
//

import UIKit

class ResultsViewController: UIViewController {

    
    @IBOutlet var totalLabel: UILabel!
    @IBOutlet var settingsLabel: UILabel!
    
    var result: String?
    var numberOfPeople: Int?
    var tipPercentage: Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = result
        settingsLabel.text = "Split between \(numberOfPeople!) people, with a \(tipPercentage!)% tip"
    }
    
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    

}
