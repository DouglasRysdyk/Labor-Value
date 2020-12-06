//
//  Calculations.swift
//  Labor-Value
//
//  Created by Douglas Rysdyk on 11/24/20.
//

import Foundation

class Calculations {
    //Adds all of the user's entries together into one pile.
    private var accumulator = 0.0
    
    //TODO: Add binary operations (x+y).  I will not be using unary (sqrt).
    //TODO: Add a clear or reset button.
    //TODO: Add an error that occurs when either the income is 0 or null, or the item pirce is 0 or null.  
    
    func hoursToWork(itemPrice: Double, hourlyIncome: Double) -> Double {
        let hoursToWorkResult: Double = itemPrice / hourlyIncome
        
        return hoursToWorkResult
    }
    
    func hoursToSeconds(hoursToWork: Double) -> Double {
        let secondsInAnHour = 3600.0
        
        let hoursToSecondsResult: Double = hoursToWork / secondsInAnHour
        
        return hoursToSecondsResult
    }
    
    func hoursToMinutes(hoursToWork: Double) -> Double {
        let minutesInAnHour = 60.0
        
        let hoursToMinutesResult: Double = hoursToWork / minutesInAnHour
        
        return hoursToMinutesResult
    }
    
    //TODO:
    //Figure what I need to do for hours to days.
      //I don't honestly remember why I was doing this in the first place.
    //When I've figured this out add the other functions (listed below).
}

/*
 - Income / unit of time = Income per unit of time

 - SECONDS in an hour = 3600
 - MINUTES in an hour = 60
 
 - Hours in a DAY = 24
 - Hours in WEEK = 168
 - Hours in a MONTH = 730.5
 - Hours in a YEAR = 8,766
*/
