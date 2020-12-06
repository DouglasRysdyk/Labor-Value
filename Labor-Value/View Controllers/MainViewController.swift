//
//  MainViewController.swift
//  Labor-Value
//
//  Created by Douglas Rysdyk on 11/22/20.
//

import UIKit

//TODO: Refactor all things that say Textfield to say TextField (CAPITAL F)

class MainViewController: UIViewController {
    let theCalculationsModel = Calculations()
    
    //Can use incomeTextfield for testing, but should be changed.
    @IBOutlet weak var incomeTextField: UITextField! //Broken outlet
    @IBOutlet weak var itemPriceTextField: UITextField!
    
    @IBOutlet weak var findOutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //TODO: Add the Add Another Item button functionality.
      //Connect the Add Another Item button.
      //When the button is pressed clear the textfield.
      //Save the number previously added to the textfield.
      //This is just like the Stanford calc.  Look to it if you have problems.
    
    // MARK: Prepare for Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("I'm in prepare for segue!")
        
        if let actualDestination = segue.destination as? ResultsViewController, let actualSender = sender as? UIButton {
            actualDestination.theCalculationsModel = theCalculationsModel
            
            //When the user presses the Find Out button, do the calculations and segue the result.
            if actualSender == findOutButton {
                let incomeString = incomeTextfield.text ?? "0"
                let itemPriceString = itemPriceTextfield.text ?? "0"
                
                let theIncome = Double(incomeString) ?? 0
                let theItemPrice = Double(itemPriceString) ?? 0
                
                let theResult = theCalculationsModel.hoursToWork(itemPrice: theItemPrice, hourlyIncome: theIncome)
                
                actualDestination.theResultString = String(theResult)
            }
        }
        
        //TODO: Clear the item price textfield.
    }
    
    
}

//How to convert a string to int with a default value -- https://www.hackingwithswift.com/example-code/language/how-to-convert-a-string-to-an-int
