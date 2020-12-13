//
//  ResultsViewController.swift
//  Labor-Value
//
//  Created by Douglas Rysdyk on 11/30/20.
//

import UIKit

//TODO: Need an If Statement to see if I should show these results, but do that in the ResultsViewController

class ResultsViewController: UIViewController {
    var theCalculationsModel: Calculations?
    
    @IBOutlet weak var theResult: UILabel!
    
    //Holds the segued result data.
    //I should 100% never ever see it say error.
    var theResultString = "Error!"
    
    //Holds the result for the displayOriginalNumber function.
    var savedResult = 0.0
    
    //Load the scene.  
    override func viewDidLoad() {
        super.viewDidLoad()

        theResult.text = theResultString
        
        print("viewDidLoad: ", savedResult)
        savedResult = Double(theResultString) ?? 0.0
    }
    
    //Simply show the original number.  No calculations.
    @IBAction func displayOriginalNumber(_ sender: Any) {
        print("displayOriginalNumber: ", savedResult)
        
        //I shouldn't see this either.
        if savedResult == 0.0 {
            theResult.text = "Error!"
        }
        
        theResult.text = String(savedResult)
    }
    
    //Convert hours to seconds.
    @IBAction func hoursToSeconds(_ sender: Any) {
        //TODO: Review this I don't trust it.
        theResult.text = String(theCalculationsModel?.workHoursToSeconds(hoursToWork: savedResult) ?? savedResult)
    }
    
    //Convert hours to minutes.
    @IBAction func hoursToMinutes(_ sender: Any) {
        //TODO: Review this I don't trust it.
        theResult.text = String(theCalculationsModel?.workHoursToMinutes(hoursToWork: savedResult) ?? savedResult)
    }
    
    //Convert hours to days if hours is greater than or equal to 24.
    @IBAction func hoursToDays(_ sender: Any) {
        theResult.text = String(theCalculationsModel?.workHoursToDays(hoursToWork: savedResult) ?? savedResult)
    }
    
    //Convert hours to weeks if hours is greater than or equal to 168.
    @IBAction func hoursToWeeks(_ sender: Any) {
        theResult.text = String(theCalculationsModel?.workHoursToWeeks(hoursToWork: savedResult) ?? savedResult)
    }
    
    //Convert hours to months if hours is greater than or equal to 730.5.
    @IBAction func hoursToMonths(_ sender: Any) {
        theResult.text = String(theCalculationsModel?.workHoursToMonths(hoursToWork: savedResult) ?? savedResult)
    }
    
    //Convert hours to yearss if hours is greater than or equal to 8766.
    @IBAction func hoursToYears(_ sender: Any) {
        theResult.text = String(theCalculationsModel?.workHoursToYears(hoursToWork: savedResult) ?? savedResult)
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
