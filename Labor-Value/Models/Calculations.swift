//
//  Calculations.swift
//  Labor-Value
//
//  Created by Douglas Rysdyk on 11/24/20.
//

import Foundation

class Calculations {
    func hoursToWork(itemPrice: Double, hourlyIncome: Double) -> Double {
        let theResult: Double = itemPrice / hourlyIncome
        
        return theResult
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
