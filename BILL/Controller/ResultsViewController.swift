//
//  ResultsViewController.swift
//  BILL
//
//  Created by Valery Keplin on 14.06.22.
//

import UIKit

class ResultsViewController: UIViewController {

    var result = ""
    var totalBill = ""
    var tip = 0
    var people = 2
    let peopleText = [2:"двоих", 3:"троих", 4:"четверых", 5:"пятерых", 6:"шестерых", 7:"семерых", 8:"восьмерых", 9:"девятерых", 10:"десятерых", 11:"11 человек", 12:"12 человек", 13:"13 человек", 14:"14 человек", 15:"15 человек", 16:"16 человек", 17:"17 человек", 18:"18 человек", 19:"19 человек", 20:"20 человек"]
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    override var shouldAutorotate: Bool {
        return false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = result
        settingsLabel.text = "Счёт в \(totalBill) раскинули на \(peopleText[people] ?? "сколько-то там человек") с учетом \(tip)% чаевых"
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
