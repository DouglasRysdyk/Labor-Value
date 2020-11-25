//
//  Calculations.swift
//  Labor-Value
//
//  Created by Douglas Rysdyk on 11/24/20.
//

import Foundation

class Calculations {
    func hoursToWork(itemPrice: Int, hourlyIncome: Int) -> Int {
        let theResult = itemPrice / hourlyIncome
        
        //TODO: Make theResult a double.  
        
        return theResult
    }
    
    
}

/*
 - Income / unit of time = Income per unit of time

 //TODO: Add calculations for hours to seconds, minutes, days, weeks, months, years
 
 - Seconds in a minute = 60
 - Seconds in an hour = 3600
 - Minutes in an hour = 60
 - Hours in a day = 24
 - Hours in a month = 730.5
 - Hours in a year = 8,766
*/
