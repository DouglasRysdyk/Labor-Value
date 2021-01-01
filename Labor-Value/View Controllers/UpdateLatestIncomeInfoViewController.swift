//
//  FirstTimeViewController.swift
//  Labor-Value
//
//  Created by Douglas Rysdyk on 11/30/20.
//

import UIKit

class UpdateLatestIncomeInfoViewController: UIViewController {
    //The user starts as none and needs to pick from the three options availabe.
    var userEmployeeType = "none"
    
    @IBOutlet weak var lastPaycheckTextfield: UITextField!
    @IBOutlet weak var hoursWorkedLastPaycheckTextField: UITextField!
    @IBOutlet weak var hourlyRateTextfield: UITextField!
    @IBOutlet weak var annualSalaryTextfield: UITextField!
    
    @IBOutlet weak var hourlyRateResultLabel: UILabel!

    //TODO:
      //Add "When do you receive your paychecks?" outlets.  Should do when tackling the persistent container stuff.
        //Week outlet
        //Two Weeks outlet
        //Month outlet
        //Year outlet 
    
    @IBOutlet weak var saveUserSettingsButton: UIButton!
    
    //Load the view.  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideKeyboardWhenTappedAround()
        
        //Later I'll make it so that it only turns off if the user does not have a budget saved.  This requires persistence.  
        saveUserSettingsButton.isEnabled = false
    }
    
    @IBAction func setEmployeeTypeToHourly(_ sender: Any) {
        userEmployeeType = "hourly"
        
        //TODO:
        //When the user chooses the hourly option the associated textfield and label are enabled.
    }
    
    
    @IBAction func setEmployeeTypeToSalary(_ sender: Any) {
        userEmployeeType = "salary"
        
        //TODO:
        //When the user chooses the salary option enable the textfield and label that ask for the user's yearly salary.
        if (userEmployeeType == "salary") {
            print("Do this later")
        }
    }
    
    @IBAction func setEmployeeTypeToFreelance(_ sender: Any) {
        userEmployeeType = "freelance"
        
        //TODO:
        //When the user chooses the freelance option the associated textfield and label are enabled.
    }
    
    @IBAction func checkLastPayCheckTextField (_ sender: Any) {
        let lastPaycheckString = lastPaycheckTextfield.text ?? "0"
        //Old code, keeping for syntax reference:
        //let theLastPaycheck = Double(lastPaycheckString) ?? 0.0
        
        if (lastPaycheckString.isEmpty) {
            lastPaycheckTextfield.text = "0"
        } else {
            saveUserSettingsButton.isEnabled = true
       }
    }
    
    @IBAction func checkHoursWorkedLastPaycheckTextField (_ sender: Any) {
        let hoursWorkedLastPaycheckString = hoursWorkedLastPaycheckTextField.text ?? "0"
        
        if (hoursWorkedLastPaycheckString.isEmpty) {
            hoursWorkedLastPaycheckTextField.text = "0"
        } else {
            saveUserSettingsButton.isEnabled = true
       }
    }
    
    @IBAction func checkHourlyRateTextField(_ sender: Any) {
        let hourlyRateString = hourlyRateTextfield.text ?? "0"
        
        if (hourlyRateString.isEmpty) {
            hourlyRateTextfield.text = "0"
        } else {
            saveUserSettingsButton.isEnabled = true
       }
    }
    
    
    @IBAction func checkAnnualSalaryTextfield (_ sender: Any) {
        let annualSalaryString = annualSalaryTextfield.text ?? "0"
        
        if (annualSalaryString.isEmpty) {
            annualSalaryTextfield.text = "0"
        } else {
            saveUserSettingsButton.isEnabled = true
       }
    }
    
    func calculateLaborValue() {
        
    }
    
    /*
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}

//MARK: Notes on textfield stuff.
/*
hourlyRateTextfield.isEditing
hourlyRateTextfield.enablesReturnKeyAutomatically
hourlyRateTextfield.hasText
 
 - Could probably If Let unwrap the textfield stuff.  I've got like two conditionals going on and it's just kinda non sense right now.  
*/


