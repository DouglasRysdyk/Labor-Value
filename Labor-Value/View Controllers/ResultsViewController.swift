//
//  ResultsViewController.swift
//  Labor-Value
//
//  Created by Douglas Rysdyk on 11/30/20.
//

import UIKit

class ResultsViewController: UIViewController {
    var theCalculationsModel: Calculations?
    
    @IBOutlet weak var theResult: UILabel!
    
    var theResultString = "Error"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        theResult.text = theResultString
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
