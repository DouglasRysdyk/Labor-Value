//
//  Calculations.swift
//  Labor-Value
//
//  Created by Douglas Rysdyk on 11/24/20.
//

import Foundation

class Calculations {
    //Adds all of the user's entries together into one pile.
    var accumulator = 0.0
    var originalAccumulatorValue = 0.0
    
    //MARK: WORKING ON
    func calculateLaborValue(itemPrice: Double, userIncome: Double) -> Double {
        accumulator = itemPrice / userIncome
        originalAccumulatorValue = accumulator //Save the accumulator in case I overwrite it.
        
        //do the calculation for each conversion and then compare conversions until we find the smallest option that is NOT zero.
        /*
         //NOT WORKING FIRST ATTEMPT WILL TRY AGAIN AFTER I GET RID OF THE CONSTRAINT ERRORS 
        if (workHoursToSeconds(hoursToWork: accumulator) < workHoursToMinutes(hoursToWork: accumulator) && workHoursToSeconds(hoursToWork: accumulator) != 0.0) {
            return workHoursToSeconds(hoursToWork: accumulator)
        } else if (workHoursToMinutes(hoursToWork: accumulator) < originalAccumulatorValue && workHoursToMinutes(hoursToWork: accumulator) != 0.0) {
            return workHoursToMinutes(hoursToWork: accumulator)
        } else if (originalAccumulatorValue < workHoursToDays(hoursToWork: accumulator) && originalAccumulatorValue != 0.0) {
            return originalAccumulatorValue
        } else if (workHoursToDays(hoursToWork: accumulator) < workHoursToWeeks(hoursToWork: accumulator) && workHoursToDays(hoursToWork: accumulator) != 0.0) {
            return workHoursToDays(hoursToWork: accumulator)
        } else if (workHoursToWeeks(hoursToWork: accumulator) < workHoursToMonths(hoursToWork: accumulator) && workHoursToWeeks(hoursToWork: accumulator) != 0.0) {
            return workHoursToWeeks(hoursToWork: accumulator)
        } else if (workHoursToMonths(hoursToWork: accumulator) < workHoursToYears(hoursToWork: accumulator) && workHoursToMonths(hoursToWork: accumulator) != 0.0) {
            return workHoursToMonths(hoursToWork: accumulator)
        } else {
            return workHoursToYears(hoursToWork: accumulator)
        }
        */
        
        //Commented out because I know this works and this is getting distracting.  Keeping in case I need to bug fix.  
//        print("TEST: totalItems = ", accumulator)
        
        //Returns the final value
        return accumulator
    }
    
    //Binary operation for adding multiple items.
    func addMultipleItemPrices(newEntry: Double, currentTotal: Double) -> Double {
        print("Before adding an item", accumulator)
        
        accumulator = newEntry + currentTotal
        
        print("After adding an item", accumulator)
        
        return accumulator
    }
    
    //Binary operation for removing multiple items.
    func removeMultipleItemPrices(newEntry: Double, currentTotal: Double) -> Double {
        print("Before removing an item", accumulator)
        
        accumulator = newEntry - currentTotal
        
        print("After removing an item", accumulator)
        
        return accumulator
    }
    
    /* TODO:
     - Set up UI in the MainView to allow for adding multiple items.
       - Set up a tableview with the user's item history.
       - Set up the ability to remove an item from the user's history.
         - I will need another function for removing an item from the current total.  The number will come from the index path.
     - Write a binary operation function for subtracting from the total number of items.
     */
    
    //MARK: Functions for converting from labor hours to minutes, days, etc.
    func workHoursToSeconds(hoursToWork: Double) -> Double {
        let secondsInAnHour = 3600.0
        
        let hoursToSecondsResult: Double = hoursToWork * secondsInAnHour
        
        return hoursToSecondsResult
    }
    
    func workHoursToMinutes(hoursToWork: Double) -> Double {
        let minutesInAnHour = 60.0
        
        let hoursToMinutesResult: Double = hoursToWork * minutesInAnHour
        
        return hoursToMinutesResult
    }
    
    func workHoursToDays(hoursToWork: Double) -> Double {
        let hoursInADay = 24.0
        
        let hoursToDaysResult: Double = hoursToWork / hoursInADay
        
        return hoursToDaysResult
    }
    
    func workHoursToWeeks(hoursToWork: Double) -> Double {
        let hoursInAWeek = 168.0
        
        let hoursToWeeksResult: Double = hoursToWork / hoursInAWeek
        
        return hoursToWeeksResult
    }
    
    func workHoursToMonths(hoursToWork: Double) -> Double {
        let hoursInAMonth = 730.5
        
        let hoursToMonthsResult: Double = hoursToWork / hoursInAMonth
        
        return hoursToMonthsResult
    }
    
    func workHoursToYears(hoursToWork: Double) -> Double {
        let hoursInAYear = 8766.0
        
        let hoursToYearsResult: Double = hoursToWork / hoursInAYear
        
        return hoursToYearsResult
    }
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
