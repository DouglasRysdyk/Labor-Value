//
//  MainViewController.swift
//  Labor-Value
//
//  Created by Douglas Rysdyk on 11/22/20.
//

import UIKit

class MainViewController: UIViewController {
    let theCalculationsModel = Calculations()
    let savedUserIncomeSuiteDefault = UserDefaultsManager()
    
    @IBOutlet weak var incomeTextField: UITextField! {
        didSet { incomeTextField?.addDoneCancelToolbar() }
    }
    
    @IBOutlet weak var itemPriceTextField: UITextField! {
        didSet { itemPriceTextField?.addDoneCancelToolbar() }
    }
    
    @IBOutlet weak var theResult: UILabel!
    
    @IBOutlet weak var hoursToSecondsButton: UIButton!
    @IBOutlet weak var hoursToMinutesButton: UIButton!
    @IBOutlet weak var displayOriginalNumberButton: UIButton!
    @IBOutlet weak var hoursToDaysButton: UIButton!
    @IBOutlet weak var hoursToWeeksButton: UIButton!
    @IBOutlet weak var hoursToMonthsButton: UIButton!
    @IBOutlet weak var hoursToYearsButton: UIButton!

    var theResultString = ""
    var theUnitOfTime = ""
    
    //Load the view.  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //On load, set the incomeTextField.text to whatever value is saved in User Defaults.
        if let value = UserDefaultsManager.shared.savedUserIncomeSuiteDefault?.value(forKey: "userIncome") as? String {
            //MARK: Fix!
            incomeTextField.text = value
        } else {
            //TODO: Should throw a proper error.  Do later.
            print("There is an error with userDefaults.")
        }
        
        //TODO: The result text should start empty every time.  Could start or reset to instructions?
        theResult.text = "PLACEHOLDER: Should start with instructions."
        
        hideTimeConversionButtons(displaySwitch: true)
        
        hideKeyboardWhenTappedAround()
    }
    
    //Editing Did End
    @IBAction func updateUserIncome(_ sender: Any) {
        //Take the incomeTextField.text and save it to User Defaults with the key userIncome.
        print("Successfully updated userIncome")
        UserDefaultsManager.shared.savedUserIncomeSuiteDefault?.setValue(incomeTextField.text, forKey: "userIncome")
    }
    
    //Do the calculation here.
    @IBAction func itemPriceTextFieldEditingChanged(_ sender: UITextField) {
        //Editing Changed Source -- https://youtu.be/XUH1O1BTUvo?t=100 till 6:26
        
        theResultString = calculateHourlyLaborValue()
        
        theUnitOfTime = "hours"
        
        hideTimeConversionButtons(displaySwitch: false)
        
        theResult.text = "It would take \(theResultString) \(theUnitOfTime) to pay for this."
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
        
        hideTimeConversionButtons(displaySwitch: true)
        
        itemPriceTextField.text = String(format: "%.02f", theCalculationsModel.accumulator)
        
        //Make the result label disappear.
        theResult.text = ""
    }

    @IBAction func displayOriginalNumber(_ sender: Any) {
        theResultString = calculateHourlyLaborValue()
        
        theUnitOfTime = "hours"
        
        theResult.text = "It would take \(theResultString) \(theUnitOfTime) to pay for this"
    }
    
    @IBAction func hoursToSeconds(_ sender: Any) {
        theResultString = String(format: "%.0f", theCalculationsModel.workHoursToSeconds(hoursToWork: theCalculationsModel.accumulator))
        
        theUnitOfTime = "seconds"
        
        theResult.text = "It would take \(theResultString) \(theUnitOfTime) to pay for this"
    }
    
    @IBAction func hoursToMinutes(_ sender: Any) {
        theResultString = String(format: "%.0f", theCalculationsModel.workHoursToMinutes(hoursToWork: theCalculationsModel.accumulator))
        
        theUnitOfTime = "minutes"
        
        theResult.text = "It would take \(theResultString) \(theUnitOfTime) to pay for this"
    }
    
    @IBAction func hoursToDays(_ sender: Any) {
        theResultString = String(format: "%.0f", theCalculationsModel.workHoursToDays(hoursToWork: theCalculationsModel.accumulator))
        
        theUnitOfTime = "days"
        
        theResult.text = "It would take \(theResultString) \(theUnitOfTime) to pay for this"
    }
    
    @IBAction func hoursToWeeks(_ sender: Any) {
        theResultString = String(format: "%.0f", theCalculationsModel.workHoursToWeeks(hoursToWork: theCalculationsModel.accumulator))
        
        theUnitOfTime = "weeks"
        
        theResult.text = "It would take \(theResultString) \(theUnitOfTime) to pay for this"
    }
    
    @IBAction func hoursToMonths(_ sender: Any) {
        theResultString = String(format: "%.0f", theCalculationsModel.workHoursToMonths(hoursToWork: theCalculationsModel.accumulator))
        
        theUnitOfTime = "months"
        
        theResult.text = "It would take \(theResultString) \(theUnitOfTime) to pay for this"
    }
    
    @IBAction func hoursToYears(_ sender: Any) {
        theResultString = String(format: "%.0f", theCalculationsModel.workHoursToYears(hoursToWork: theCalculationsModel.accumulator))
        
        theUnitOfTime = "years"
        
        theResult.text = "It would take \(theResultString) \(theUnitOfTime) to pay for this"
    }
    
    func hideTimeConversionButtons(displaySwitch: Bool) {
        hoursToSecondsButton.isHidden = displaySwitch
        hoursToMinutesButton.isHidden = displaySwitch
        displayOriginalNumberButton.isHidden = displaySwitch
        hoursToDaysButton.isHidden = displaySwitch
        hoursToWeeksButton.isHidden = displaySwitch
        hoursToMonthsButton.isHidden = displaySwitch
        hoursToYearsButton.isHidden = displaySwitch
    }
    
    func calculateHourlyLaborValue() -> String {
        //Convert the textfield text to doubles.
        let theItemPrice = Double(itemPriceTextField.text ?? "0") ?? 0.0
        let theIncome = Double(incomeTextField.text ?? "0") ?? 0.0
    
        //Convert the result to a String for theResult label.
        //TODO: Make anything less than 0 human legible (like say "it's less than half an hour" or something).
        //I don't honestly know how I'll do this.
        //I'll need a switch or something with different responses loaded up.
        theResultString = String(format: "%.0f", theCalculationsModel.hoursToWork(itemPrice: theItemPrice, userIncome: theIncome))
    
        return theResultString
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

//User Defaults code based off of https://www.youtube.com/watch?v=XzWBT6lIB3A and https://programmingwithswift.com/how-to-use-userdefaults-suites-with-swift/

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

//MARK: Trash?
//Source -- https://stackoverflow.com/questions/33527662/add-remove-currency-formatting-in-swift
//Use example: "74719.4048014544".currencyFormatting() // $74,719.40
extension String {
    // formatting text for currency textField
    func stringCurrencyFormatting() -> String {
        if let value = Double(self) {
            let formatter = NumberFormatter()
            formatter.numberStyle = .currency
            formatter.maximumFractionDigits = 2
            if let theString = formatter.string(for: value) {
                return theString
            }
        }
        return ""
    }
}
 

