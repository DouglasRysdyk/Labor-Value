//
//  MainViewController.swift
//  Labor-Value
//
//  Created by Douglas Rysdyk on 11/22/20.
//

import UIKit

class MainViewController: UIViewController {
    let theCalculationsModel = Calculations()
    
    //FIXME: FOR TESTING ONLY
    @IBOutlet weak var incomeTextField: UITextField!
    @IBOutlet weak var itemPriceTextField: UITextField!
    
    @IBOutlet weak var theResult: UILabel!

    var theResultString = ""
    
    //This is the default option.
    //TODO: Make sure this doesn't show up somewhere other than the result label's text.
    //TODO: I feel hard coding this might be the wrong move but I'll think it through later.
    var theUnitOfTime = "hours"
    
    //Display the original number and possibly more.
    var savedResult = 0.0
    
    //Load the view.  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //The result text should start empty every time.
        theResult.text = theResultString
        
        hideKeyboardWhenTappedAround()
    }
    
    //FIXME: FOR TESTING ONLY
    //TODO: Replace with a function that checks for when the text changes and runs a calculation and label rewrite each time there is a change.  No need to hit enter.
    @IBAction func getResult(_ sender: Any) {
        let itemPriceString = itemPriceTextField.text ?? "0"
        let theItemPrice = Double(itemPriceString) ?? 0.0
        
        let incomeString = incomeTextField.text ?? "0"
        let theIncome = Double(incomeString) ?? 0.0
        
        //Save the calculated result
        savedResult = theCalculationsModel.hoursToWork(itemPrice: theItemPrice, userIncome: theIncome)
        
        //Convert the savedResult into a string for theResult label.
        theResultString = String(savedResult)
        
        //Change theResult's label text to this using the previous calculations.
        //MARK: DRY 1
        theResult.text = "It would take \(theResultString) \(theUnitOfTime) to pay for this"
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
        
        //Disappear the result label.
        theResult.text = ""
    }
 
    @IBAction func displayOriginalNumber(_ sender: Any) {
        //I should never see this.
        if savedResult == 0.0 {
            theResult.text = "Error!"
        }
        
        //MARK: DRY 1
        theResult.text = "It would take \(theResultString) \(theUnitOfTime) to pay for this"
        
        theUnitOfTime = "hours"
    }
    
    @IBAction func hoursToSeconds(_ sender: Any) {
        //MARK: DRY 2
        let convertedResult = String(theCalculationsModel.workHoursToSeconds(hoursToWork: savedResult))
        
        theResult.text = "It would take \(convertedResult) \(theUnitOfTime) to pay for this"
        
        theUnitOfTime = "seconds"
    }
    
    @IBAction func hoursToMinutes(_ sender: Any) {
        //MARK: DRY 2
        let convertedResult = String(theCalculationsModel.workHoursToMinutes(hoursToWork: savedResult))
        
        theResult.text = "It would take \(convertedResult) \(theUnitOfTime) to pay for this"
        
        theUnitOfTime = "minutes"
    }
    
    @IBAction func hoursToDays(_ sender: Any) {
        //MARK: DRY 2
        let convertedResult = String(theCalculationsModel.workHoursToDays(hoursToWork: savedResult))
        
        theResult.text = "It would take \(convertedResult) \(theUnitOfTime) to pay for this"
        
        theUnitOfTime = "days"
    }
    
    @IBAction func hoursToWeeks(_ sender: Any) {
        //MARK: DRY 2
        let convertedResult = String(theCalculationsModel.workHoursToWeeks(hoursToWork: savedResult))
        
        theResult.text = "It would take \(convertedResult) \(theUnitOfTime) to pay for this"
        
        theUnitOfTime = "weeks"
    }
    
    @IBAction func hoursToMonths(_ sender: Any) {
        //MARK: DRY 2
        let convertedResult = String(theCalculationsModel.workHoursToMonths(hoursToWork: savedResult))
        
        theResult.text = "It would take \(convertedResult) \(theUnitOfTime) to pay for this"
        
        theUnitOfTime = "months"
    }
    
    @IBAction func hoursToYears(_ sender: Any) {
        //MARK: DRY 2
        let convertedResult = String(theCalculationsModel.workHoursToYears(hoursToWork: savedResult))
        
        theResult.text = "It would take \(convertedResult) \(theUnitOfTime) to pay for this"
        
        theUnitOfTime = "years"
    }
}

//Dismiss the keyboard by tapping anywhere on the screen other than the keyboard.
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
