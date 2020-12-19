//
//  MainViewController.swift
//  Labor-Value
//
//  Created by Douglas Rysdyk on 11/22/20.
//

import UIKit

class MainViewController: UIViewController {
    let theCalculationsModel = Calculations()
    
    @IBOutlet weak var incomeTextField: UITextField! //ONLY HERE FOR TESTING
    @IBOutlet weak var itemPriceTextField: UITextField!
    
    @IBOutlet weak var findOutButton: UIButton!
    
    //Load the view.  
    override func viewDidLoad() {
        //Disable the segue button immediately.
          //Will only appear when the user hasss filled in the userIncome and the itemPrice (aka NOT nil or 0).  
        findOutButton.isEnabled = false
        
        super.viewDidLoad()
        
        hideKeyboardWhenTappedAround()
    }
    
    @IBAction func addAnotherItem(_ sender: Any) {
        //TODO: See if I can simplify this process.
        let itemPriceString = itemPriceTextField.text ?? "0"
        let theItemPrice = Double(itemPriceString) ?? 0.0
        
        //Save the numbers by adding them to the accumulator.
        theCalculationsModel.accumulator += theItemPrice
        print("Add Another Item function accumulator = ", theCalculationsModel.accumulator)
        
        //Clear the textfield.
         //TODO: Add the correct currency format (eg. $0.00)
        itemPriceTextField.text = "0"
    }
    
    @IBAction func reset(_ sender: Any) {
        //Clear the accumulator.
        theCalculationsModel.accumulator = 0.0
        print("Reset function accumulator = ", theCalculationsModel.accumulator)
        
        //Set the textfield to 0.
         //TODO: Add the correct currency format (eg. $0.00)
        itemPriceTextField.text = "0"
    }
    
    //TODO: Connect to the income textfield in this view.
    @IBAction func checkIncomeTextFeild(_ sender: Any) {
        let incomeString = incomeTextField.text ?? "0"
        let theIncome = Double(incomeString) ?? 0.0
        
        //TODO: Better but not perfect.  Need to click outside of the textfield twice to get the button to enable.
        if (incomeString.isEmpty) {
            incomeTextField.text = "0"
        } else {
            findOutButton.isEnabled = true
       }
        
        if (theIncome == 0) {
            print("Ask user about debt, expenses, and go onto building wealth route.")
        }
    }
    
    //TODO: Connect to the income textfield in this view.
    @IBAction func checkItemPriceTextFeild(_ sender: Any) {
        let itemPriceString = itemPriceTextField.text ?? "0"
        let theItemPrice = Double(itemPriceString) ?? 0.0
        
        //TODO: Better but not perfect.  Need to click outside of the textfield twice to get the button to enable.
        if (itemPriceString.isEmpty) {
            itemPriceTextField.text = "0"
        } else {
            findOutButton.isEnabled = true
       }
        
        if (theItemPrice == 0) {
            print("Ask user about debt, expenses, and go onto building wealth route.")
        }
    }
    
    // MARK: Prepare for Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let actualDestination = segue.destination as? ResultsViewController, let actualSender = sender as? UIButton {
            actualDestination.theCalculationsModel = theCalculationsModel
            
            //When the user presses the Find Out button, do the calculations and segue the result.
            if actualSender == findOutButton {
                //TODO: See if I can simplify this process.
                let incomeString = incomeTextField.text ?? "0"
                let itemPriceString = itemPriceTextField.text ?? "0"
                
                //TODO: See if I can simplify this process.
                let theIncome = Double(incomeString) ?? 0.0
                let theItemPrice = Double(itemPriceString) ?? 0.0
                
                let theResult = theCalculationsModel.hoursToWork(itemPrice: theItemPrice, userIncome: theIncome)
                
                actualDestination.theResultString = String(theResult)
            }
        }
        
        //Clear the textfield.
         //TODO: Add the correct currency format (eg. $0.00)
        itemPriceTextField.text = "0"
    }
}

extension UIViewController {
    //Source -- https://stackoverflow.com/questions/52019014/make-keyboard-disappear-when-clicking-outside-of-search-bar-swift 
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
