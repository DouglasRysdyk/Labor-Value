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
    var workHoursConversionsArray: [Double] = []
    var eachIndex = 0
    var theUnitOfTime = ""

    func calculateTheLaborValue(itemPrice: Double, userIncome: Double) -> Double {
        workHoursConversionsArray = [
            laborValueInYears(itemPrice: itemPrice, userIncome: userIncome),   //0
            laborValueInMonths(itemPrice: itemPrice, userIncome: userIncome),  //1
            laborValueInWeeks(itemPrice: itemPrice, userIncome: userIncome),   //2
            laborValueInDays(itemPrice: itemPrice, userIncome: userIncome),    //3
            laborValueInHours(itemPrice: itemPrice, userIncome: userIncome),   //4
            laborValueInMinutes(itemPrice: itemPrice, userIncome: userIncome), //5
            laborValueInSeconds(itemPrice: itemPrice, userIncome: userIncome)  //6
        ]
        
        for eachIndex in 0..<workHoursConversionsArray.count {
            if workHoursConversionsArray[eachIndex] >= 1 {
                theUnitOfTime = findTheUnitOfTime(theIndex: eachIndex)
                print(workHoursConversionsArray[eachIndex])
                return workHoursConversionsArray[eachIndex]
            }
        }
        
        //Commented out because I know this works and this is getting distracting.  Keeping in case I need to bug fix.  
        //print("TEST: totalItems =", accumulator)
        
        //Returns the final value
        return accumulator
    }
    
    /* //Currently unused.
       //MARK: Unchanged, may not work.
       //Binary operation for adding multiple items.
       func addMultipleItemPrices(newEntry: Double, currentTotal: Double) -> Double {
           print("Before adding an item", accumulator)
           
           accumulator = newEntry + currentTotal
           
           print("After adding an item", accumulator)
           
           return accumulator
       }
       
       //MARK: Unchanged, may not work.
       //Binary operation for removing multiple items.
       func removeMultipleItemPrices(newEntry: Double, currentTotal: Double) -> Double {
           print("Before removing an item", accumulator)
           
           accumulator = newEntry - currentTotal
           
           print("After removing an item", accumulator)
           
           return accumulator
       }
   */
 
    func laborValueInSeconds(itemPrice: Double, userIncome: Double) -> Double {
        let secondsInAnHour = 3600.0
        
        let incomeToSecondsResult: Double = userIncome / secondsInAnHour
        
        accumulator = itemPrice / incomeToSecondsResult
        
        return accumulator
    }
    
    func laborValueInMinutes(itemPrice: Double, userIncome: Double) -> Double {
        let minutesInAnHour = 60.0
        
        let incomeToMinutesResult: Double = userIncome / minutesInAnHour
        
        accumulator = itemPrice / incomeToMinutesResult
        
        return accumulator
    }
    
    func laborValueInHours(itemPrice: Double, userIncome: Double) -> Double {
        accumulator = itemPrice / userIncome
        
        return accumulator
    }
    
    func laborValueInDays(itemPrice: Double, userIncome: Double) -> Double {
        let hoursInADay = 24.0
        
        let incomeToDaysResult: Double = userIncome * hoursInADay
        
        accumulator = itemPrice / incomeToDaysResult
        
        return accumulator
    }
    
    func laborValueInWeeks(itemPrice: Double, userIncome: Double) -> Double {
        let hoursInAWeek = 168.0
        
        let incomeToWeeksResult: Double = userIncome * hoursInAWeek
        
        accumulator = itemPrice / incomeToWeeksResult
        
        return accumulator
    }
    
    func laborValueInMonths(itemPrice: Double, userIncome: Double) -> Double {
        let hoursInAMonth = 730.5
        
        let incomeToMonthsResult: Double = userIncome * hoursInAMonth
        
        accumulator = itemPrice / incomeToMonthsResult
        
        return accumulator
    }
    
    func laborValueInYears(itemPrice: Double, userIncome: Double) -> Double {
        let hoursInAYear = 8766.0
        
        let incomeToYearsResult: Double = userIncome * hoursInAYear
        
        accumulator = itemPrice / incomeToYearsResult
        
        return accumulator
    }
    
    func findTheUnitOfTime(theIndex: Int) -> String {
        var theIndexUnitOfTime = ""
        
        switch theIndex {
        case 0:
            print("year accumulator =", accumulator)
            theIndexUnitOfTime = "year"
            break
        case 1:
            print("month accumulator =", accumulator)
            theIndexUnitOfTime = "month"
            break
        case 2:
            print("week accumulator =", accumulator)
            theIndexUnitOfTime = "week"
            break
        case 3:
            print("day accumulator =", accumulator)
            theIndexUnitOfTime = "day"
            break
        case 4:
            print("hour accumulator =", accumulator)
            theIndexUnitOfTime = "hour"
            break
        case 5:
            print("minute accumulator =", accumulator)
            theIndexUnitOfTime = "minute"
            break
        case 6:
            print("second accumulator =", accumulator)
            theIndexUnitOfTime = "second"
            break
        default:
            theIndexUnitOfTime = "ERROR"
        }
        
        return theIndexUnitOfTime
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
