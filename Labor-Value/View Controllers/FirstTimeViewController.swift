//
//  FirstTimeViewController.swift
//  Labor-Value
//
//  Created by Douglas Rysdyk on 11/30/20.
//

import UIKit

class FirstTimeViewController: UIViewController {
    @IBOutlet weak var userIncomeTextField: UITextField!
    
    
    @IBOutlet weak var saveUserSettingsButton: UIButton!
    //TODO:
    //Add the outlets from the FirstTimeView
    //When the user presses the save button save this view's data in a persistent container.
     //Add Core Data entity to contain this data.
      //What attributes will I be adding?  Should be on screen in the View already.
       //This means I need to add a connection to the model here and other Core Data set up.
    
    //Load the view.  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideKeyboardWhenTappedAround()
        
        //Later I'll make it so that it only turns off if the user does not have a budget saved.  This requires persistence.  
        saveUserSettingsButton.isEnabled = false
    }
    
    @IBAction func checkTextFeild(_ sender: Any) {
        let userIncomeString = userIncomeTextField.text ?? "0"
        let userIncome = Double(userIncomeString) ?? 0.0
        
        //TODO: Better but not perfect.  Need to click outside of the textfield twice to get the button to enable.  
        if (userIncomeString.isEmpty) {
            userIncomeTextField.text = "0"
        } else {
            saveUserSettingsButton.isEnabled = true
       }
        
        if (userIncome == 0) {
            print("Ask user about debt, expenses, and go onto building wealth route.")
        }
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


