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
    
    //Load the scene.  
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //TODO:
    //THE ACCUMULATOR IS NOT HOOKED UP TO THE ACTUAL CALCULATION FUNCTIONALITY
    //TEST THE addAnotherItem FUNCTION
    @IBAction func addAnotherItem(_ sender: Any) {
        //TODO: See if I can simplify this process.  
        let itemPriceString = itemPriceTextField.text ?? "0"
        let theItemPrice = Double(itemPriceString) ?? 0
        
        //Save the numbers by adding them to the accumulator.
        theCalculationsModel.accumulator += theItemPrice
        print("Add Another Item function accumulator = ", theCalculationsModel.accumulator)
        
        //Clear the textfield.
        itemPriceTextField.text = nil
    }
    
    @IBAction func reset(_ sender: Any) {
        //Clear the accumulator.
        theCalculationsModel.accumulator = 0.0
        print("Reset function accumulator = ", theCalculationsModel.accumulator)
        
        //Clear the textfield.
        itemPriceTextField.text = nil
    }
    
    // MARK: Prepare for Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let actualDestination = segue.destination as? ResultsViewController, let actualSender = sender as? UIButton {
            actualDestination.theCalculationsModel = theCalculationsModel
            
            //When the user presses the Find Out button, do the calculations and segue the result.
            if actualSender == findOutButton {
                let incomeString = incomeTextField.text ?? "0"
                let itemPriceString = itemPriceTextField.text ?? "0"
                
                let theIncome = Double(incomeString) ?? 0
                let theItemPrice = Double(itemPriceString) ?? 0
                
                //TODO: Check if incomeString or itemPriceString are 0.  If so stop the segue.
                  //May need to use shouldPerformSegueWithIdentifier
                if (theIncome == 0) {
                    print("Please enter a number greater than 0 for your latest income.")
                }
                
                if (theItemPrice == 0) {
                    print("Please enter a number greater than 0 for the item price.")
                }
                
                let theResult = theCalculationsModel.hoursToWork(itemPrice: theItemPrice, userIncome: theIncome)
                
                actualDestination.theResultString = String(theResult)
            }
        }
        
        //Clear the textfield.  
        itemPriceTextField.text = nil
    }
}
