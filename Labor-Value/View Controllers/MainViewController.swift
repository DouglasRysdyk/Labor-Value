//
//  MainViewController.swift
//  Labor-Value
//
//  Created by Douglas Rysdyk on 11/22/20.
//

import UIKit

class MainViewController: UIViewController {
    let theCalculationsModel = Calculations()
    
    @IBOutlet weak var incomeTextfield: UITextField!
    @IBOutlet weak var itemPriceTextfield: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func findOutButton(_ sender: Any) {
        let incomeString = incomeTextfield.text ?? "0"
        let itemPriceString = itemPriceTextfield.text ?? "0"
        
        let theIncome = Int(incomeString) ?? 0
        let theItemPrice = Int(itemPriceString) ?? 0
        
        let theResult = theCalculationsModel.hoursToWork(itemPrice: theItemPrice, hourlyIncome: theIncome)
        //TODO: Make the label's dispaly an int or double depending on calculation result.
          //Like the Stanford calculator.  
        
        resultLabel.text = String(theResult)
    }
    
    /*
    // MARK: Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}

//How to convert a string to int with a default value -- https://www.hackingwithswift.com/example-code/language/how-to-convert-a-string-to-an-int
