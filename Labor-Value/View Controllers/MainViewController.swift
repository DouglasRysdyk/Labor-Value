//
//  MainViewController.swift
//  Labor-Value
//
//  Created by Douglas Rysdyk on 11/22/20.
//

import UIKit

class MainViewController: UIViewController, UITextFieldDelegate {
    let theCalculationsModel = Calculations()
    let savedUserIncomeSuiteDefault = UserDefaultsManager()
    
    let unitOfTimePickerViewData = ["Seconds", "Minutes", "Hours", "Days", "Weeks", "Months", "Years"]
    
    @IBOutlet weak var incomeTextField: UITextField! {
        didSet {
            incomeTextField?.doneButtonTapped()
            incomeTextField?.addDoneCancelToolbar(onCancel: (target: self, action: #selector(cancelButtonTappedIncomeTextField)))
        }
    }
    
    @IBOutlet weak var itemPriceTextField: UITextField! {
        didSet {
            itemPriceTextField?.doneButtonTapped()
            itemPriceTextField?.addDoneCancelToolbar(onCancel: (target: self, action: #selector(cancelButtonTappeditemPriceTextField)))
        }
    }
    
    @IBOutlet weak var theResult: UILabel!
    
    //Save the incomeTextField.text and itemPriceTextField.text before the user saves or cancels their input.
    var originalIncomeText = ""
    var originalItemPriceText = ""

    var theCalculationString = ""
    var theUnitOfTime = ""
    
    //Load the view.  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.incomeTextField.delegate = self
        self.itemPriceTextField.delegate = self
        
        //On load, set the incomeTextField.text to whatever value is saved in User Defaults.
        if let value = UserDefaultsManager.shared.savedUserIncomeSuiteDefault?.value(forKey: "userIncome") as? String {
            incomeTextField.text = value
        } else {
            //MARK: "0.00"
            incomeTextField.text = "0.00"
            print("User defaults is empty.")
        }
        
        theResult.text = theCalculationString
        
        hideKeyboardWhenTappedAround()
    }
    
    //Save the original incomeTextField.text entry before the user overwrites it.
    //Editing Did Begin IBAction
    @IBAction func saveTheOriginalIncomeText(_ sender: Any) {
        //MARK: "0.00"
        originalIncomeText = incomeTextField.text ?? "0.00"
    }
    
    //Save the original itemPriceTextField.text entry before the user overwrites it.
    //Editing Did Begin IBAction
    @IBAction func saveTheOriginalItemPriceText(_ sender: Any) {
        //MARK: "0.00"
        originalItemPriceText = itemPriceTextField.text ?? "0.00"
        
        print("originalItemPriceText = ", originalItemPriceText)
    }
    
    //Editing Did End IBAction
    @IBAction func updateUserIncome(_ sender: Any) {
        //Take the incomeTextField.text and save it to User Defaults with the key userIncome.
        print("Successfully updated userIncome")
        UserDefaultsManager.shared.savedUserIncomeSuiteDefault?.setValue(incomeTextField.text, forKey: "userIncome")
    }
    
    //MARK: WORKING ON
    //Do the calculation if the user changes their income.
    //Editing Changed IBAction
    @IBAction func incomeTextFieldEditingChanged(_ sender: Any) {
        theCalculationString = calculateHourlyLaborValue()
        
        //MARK: This is defaulted to hours I need to convert to whatever the proper unit of time is.
        let theUnitOfTime = theCalculationString == "1" ? "hour" : "hours"
    
        if theCalculationString == "nan" || theCalculationString == "inf" {
            theResult.text = ""
        } else {
            theResult.text = "It would take \(theCalculationString) \(theUnitOfTime) to pay for this."
        }
    }
    
    //Do the calculation if the user changes the item's price.
    //Editing Changed IBAction
    @IBAction func itemPriceTextFieldEditingChanged(_ sender: UITextField) {
        //Editing Changed Source -- https://youtu.be/XUH1O1BTUvo?t=100 till 6:26
        
        //MARK: WORKING ON
        theCalculationString = calculateHourlyLaborValue()
        
        let theUnitOfTime = theCalculationString == "1" ? "hour" : "hours"
        
        if theCalculationString == "nan" || theCalculationString == "inf" {
            theResult.text = ""
        } else {
            theResult.text = "It would take \(theCalculationString) \(theUnitOfTime) to pay for this."
        }
    }
    
    @IBAction func addAnotherItem(_ sender: Any) {
        let theItemPrice = Double(itemPriceTextField.text ?? "0") ?? 0.0
        
        //Save the numbers by adding them to the accumulator.
        theCalculationsModel.accumulator += theItemPrice
        print("Add Another Item function accumulator = ", theCalculationsModel.accumulator)
        
        //Clear the textfield.
        itemPriceTextField.text = String(format: "%.02f", 0)
    }
    
    @IBAction func reset(_ sender: Any) {
        theCalculationsModel.accumulator = 0.0
        print("Reset function accumulator = ", theCalculationsModel.accumulator)
        
        itemPriceTextField.text = String(format: "%.02f", theCalculationsModel.accumulator)
        
        //Make the result label disappear.
        theResult.text = ""
    }
    
    //MARK: WORKING ON
    func unitOfTimeConversion(unitOfTime: String) {
        switch unitOfTime {
        case "Seconds":
            theCalculationString = String(format: "%.0f", theCalculationsModel.workHoursToSeconds(hoursToWork: theCalculationsModel.accumulator))
            
            let theUnitOfTime = theCalculationString == "1" ? "second" : "seconds"
            
            theResult.text = "It would take \(theCalculationString) \(theUnitOfTime) to pay for this."
            break
        case "Minutes":
            theCalculationString = String(format: "%.0f", theCalculationsModel.workHoursToMinutes(hoursToWork: theCalculationsModel.accumulator))
            
            let theUnitOfTime = theCalculationString == "1" ? "minute" : "minutes"
            
            theResult.text = "It would take \(theCalculationString) \(theUnitOfTime) to pay for this."
            break
        case "Hours":
            theCalculationString = calculateHourlyLaborValue()
            
            let theUnitOfTime = theCalculationString == "1" ? "hour" : "hours"
            
            theResult.text = "It would take \(theCalculationString) \(theUnitOfTime) to pay for this."
            break
        case "Days":
            theCalculationString = String(format: "%.0f", theCalculationsModel.workHoursToDays(hoursToWork: theCalculationsModel.accumulator))
            
            let theUnitOfTime = theCalculationString == "1" ? "day" : "days"
            
            theResult.text = "It would take \(theCalculationString) \(theUnitOfTime) to pay for this."
            break
        case "Weeks":
            theCalculationString = String(format: "%.0f", theCalculationsModel.workHoursToWeeks(hoursToWork: theCalculationsModel.accumulator))
            
            let theUnitOfTime = theCalculationString == "1" ? "week" : "weeks"
            
            theResult.text = "It would take \(theCalculationString) \(theUnitOfTime) to pay for this."
            break
        case "Months":
            theCalculationString = String(format: "%.0f", theCalculationsModel.workHoursToMonths(hoursToWork: theCalculationsModel.accumulator))
            
            let theUnitOfTime = theCalculationString == "1" ? "month" : "months"
            
            theResult.text = "It would take \(theCalculationString) \(theUnitOfTime) to pay for this."
            break
        case "Years":
            theCalculationString = String(format: "%.0f", theCalculationsModel.workHoursToYears(hoursToWork: theCalculationsModel.accumulator))
            
            let theUnitOfTime = theCalculationString == "1" ? "year" : "years"
            
            theResult.text = "It would take \(theCalculationString) \(theUnitOfTime) to pay for this."
            break
        default:
            //By default run the "Hours" case
            theCalculationString = calculateHourlyLaborValue()
            
            let theUnitOfTime = theCalculationString == "1" ? "hour" : "hours"
            
            theResult.text = "It would take \(theCalculationString) \(theUnitOfTime) to pay for this."
        }
    }
    
    @objc func cancelButtonTappedIncomeTextField() {
        incomeTextField.text = originalIncomeText
        
        incomeTextField.resignFirstResponder()
    }
    
    @objc func cancelButtonTappeditemPriceTextField() {
        itemPriceTextField.text = originalItemPriceText
        
        itemPriceTextField.resignFirstResponder()
    }
    
    //MARK: Need to convert from this result to
     //Alternatively I can use maybe a For Loop to figure out which answers are too low.
     //Will prolly need to change the name of this and anything else that references the "hourly" labor value specifically.  
    func calculateHourlyLaborValue() -> String {
        //Convert the textfield text to doubles.
        let theItemPrice = Double(itemPriceTextField.text ?? "0") ?? 0.0
        let theIncome = Double(incomeTextField.text ?? "0") ?? 0.0
    
        //MARK: Change in theCalculationModel.
        //Convert the result to a String for theResult label.
        //TODO: Make anything less than 0 human legible (like say "it's less than half an hour" or something).
        theCalculationString = String(format: "%.0f", theCalculationsModel.calculateLaborValue(itemPrice: theItemPrice, userIncome: theIncome))
    
        return theCalculationString
    }
    
    //Source (2nd Answer) -- https://stackoverflow.com/questions/27883171/how-do-you-limit-only-1-decimal-entry-in-a-uitextfield-in-swift-for-ios8/27884715
    //Need UITextFieldDelegate, and in viewDidLoad self.textField.delegate = self
    func textField(_ textField: UITextField,shouldChangeCharactersIn range: NSRange,replacementString string: String) -> Bool {
        //MARK: Force unwrap
        let countdots = (textField.text?.components(separatedBy: ".").count)! - 1

        if countdots > 0 && string == "." {
            return false
        }
        return true
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

//Source (first answer) -- https://stackoverflow.com/questions/38133853/how-to-add-a-return-key-on-a-decimal-pad-in-swift
extension UITextField {
    func addDoneCancelToolbar(onDone: (target: Any, action: Selector)? = nil, onCancel: (target: Any, action: Selector)? = nil) {
        let onCancel = onCancel ?? (target: self, action: #selector(cancelButtonTapped))
        let onDone = onDone ?? (target: self, action: #selector(doneButtonTapped))

        let toolbar: UIToolbar = UIToolbar()
        toolbar.barStyle = .default
        toolbar.items = [
            UIBarButtonItem(title: "Cancel", style: .plain, target: onCancel.target, action: onCancel.action),
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil),
            UIBarButtonItem(title: "Done", style: .done, target: onDone.target, action: onDone.action)
        ]
        toolbar.sizeToFit()

        self.inputAccessoryView = toolbar
    }

    // Default actions:
    @objc func doneButtonTapped() { self.resignFirstResponder() }
    @objc func cancelButtonTapped() { self.resignFirstResponder() }
}

//User Defaults code based off of https://www.youtube.com/watch?v=XzWBT6lIB3A and https://programmingwithswift.com/how-to-use-userdefaults-suites-with-swift/
