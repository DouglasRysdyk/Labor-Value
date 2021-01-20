//
//  MainViewController.swift
//  Labor-Value
//
//  Created by Douglas Rysdyk on 11/22/20.
//

import UIKit

class MainViewController: UIViewController {
    let theCalculationsModel = Calculations()
    //MARK: User Defaults draft
    //TODO: Replace with a call to the UserDefaultsManager class
    //TODO: Add suite name
    let userDefaults = UserDefaults()
    
    @IBOutlet weak var incomeTextField: UITextField!
    @IBOutlet weak var itemPriceTextField: UITextField!
    
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
    
    //Display the original number and use for time conversions.
    var savedResult = 0.0
    
    //Load the view.  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //On load, set the incomeTextField.text to whatever the userIncome is saved as.
        if let value = userDefaults.value(forKey: "userIncome") as? String {
            //MARK: Testing 1
            print("I am setting the incomeTextField.text to \(value)")
            incomeTextField.text = value
        } else {
            //MARK: Testing 1
            //TODO: Should throw a proper error.  Do later.
            print("There is an error with userDefaults.")
        }
        
        //TODO: The result text should start empty every time.  Could start or reset to instructions?
        theResult.text = theResultString
        
        hideTimeConversionButtons(displaySwitch: true)
        
        hideKeyboardWhenTappedAround()
    }
    
    //Did End On Exit IBAction
    //TODO: Maybe try other editing stuff.  
    @IBAction func updateUserIncome(_ sender: Any) {
        //Take the incomeTextField.text and save it to User Defaults with the key userIncome.
        userDefaults.setValue(incomeTextField.text, forKey: "userIncome")
        
        //MARK: Testing 1
        if let value = userDefaults.value(forKey: "userIncome") as? String {
            print("userIncome is now \(value)")
        } else {
            //Maybe this happened because the value was nil originally?  Weird... I've got a bad feeling about this.
            print("I am a sad :(")
        }
        
        print("Editing did end on exit.")
    }
    
    //Do the calculation here.
    @IBAction func itemPriceTextFieldEditingChanged(_ sender: UITextField) {
        //Editing Changed Source -- https://youtu.be/XUH1O1BTUvo?t=100 till 6:26
        
        //Convert the textfield text to doubles.
        let theItemPrice = Double(itemPriceTextField.text ?? "0") ?? 0.0
        let theIncome = Double(incomeTextField.text ?? "0") ?? 0.0
            
        //Save the calculated result
        savedResult = theCalculationsModel.hoursToWork(itemPrice: theItemPrice, userIncome: theIncome)
            
        //Convert the savedResult into a string for theResult label.
        theResultString = String(savedResult)
        
        theUnitOfTime = "hours"
        
        hideTimeConversionButtons(displaySwitch: false)
            
        //Change theResult's label text to this using the previous calculations.
        //MARK: DRY 1
        theResult.text = "It would take \(theResultString) \(theUnitOfTime) to pay for this."
    }
    
    @IBAction func addAnotherItem(_ sender: Any) {
        let theItemPrice = Double(itemPriceTextField.text ?? "0") ?? 0.0
        
        //Save the numbers by adding them to the accumulator.
        theCalculationsModel.accumulator += theItemPrice
        print("Add Another Item function accumulator = ", theCalculationsModel.accumulator)
        
        //Clear the textfield.
         //TODO: Add the correct currency format (eg. $0.00)
        itemPriceTextField.text = "0"
    }
    
    @IBAction func reset(_ sender: Any) {
        theCalculationsModel.accumulator = 0.0
        print("Reset function accumulator = ", theCalculationsModel.accumulator)
        
        hideTimeConversionButtons(displaySwitch: true)
        
         //TODO: Add the correct currency format (eg. $0.00)
        itemPriceTextField.text = "0.00"
        
        //Make the result label disappear.
        theResult.text = ""
    }
 
    @IBAction func displayOriginalNumber(_ sender: Any) {
        //I should never see this.
        if savedResult == 0.0 {
            theResult.text = "Error!"
        }
        
        theUnitOfTime = "hours"
        
        //MARK: DRY 1
        theResult.text = "It would take \(theResultString) \(theUnitOfTime) to pay for this"
    }
    
    @IBAction func hoursToSeconds(_ sender: Any) {
        //MARK: DRY 2
        let convertedResult = String(theCalculationsModel.workHoursToSeconds(hoursToWork: savedResult))
        
        theUnitOfTime = "seconds"
        
        theResult.text = "It would take \(convertedResult) \(theUnitOfTime) to pay for this"
    }
    
    @IBAction func hoursToMinutes(_ sender: Any) {
        //MARK: DRY 2
        let convertedResult = String(theCalculationsModel.workHoursToMinutes(hoursToWork: savedResult))
        
        theUnitOfTime = "minutes"
        
        theResult.text = "It would take \(convertedResult) \(theUnitOfTime) to pay for this"
    }
    
    @IBAction func hoursToDays(_ sender: Any) {
        //MARK: DRY 2
        let convertedResult = String(theCalculationsModel.workHoursToDays(hoursToWork: savedResult))
        
        theUnitOfTime = "days"
        
        theResult.text = "It would take \(convertedResult) \(theUnitOfTime) to pay for this"
    }
    
    @IBAction func hoursToWeeks(_ sender: Any) {
        //MARK: DRY 2
        let convertedResult = String(theCalculationsModel.workHoursToWeeks(hoursToWork: savedResult))
        
        theUnitOfTime = "weeks"
        
        theResult.text = "It would take \(convertedResult) \(theUnitOfTime) to pay for this"
    }
    
    @IBAction func hoursToMonths(_ sender: Any) {
        //MARK: DRY 2
        let convertedResult = String(theCalculationsModel.workHoursToMonths(hoursToWork: savedResult))
        
        theUnitOfTime = "months"
        
        theResult.text = "It would take \(convertedResult) \(theUnitOfTime) to pay for this"
    }
    
    @IBAction func hoursToYears(_ sender: Any) {
        //MARK: DRY 2
        let convertedResult = String(theCalculationsModel.workHoursToYears(hoursToWork: savedResult))
        
        theUnitOfTime = "years"
        
        theResult.text = "It would take \(convertedResult) \(theUnitOfTime) to pay for this"
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
