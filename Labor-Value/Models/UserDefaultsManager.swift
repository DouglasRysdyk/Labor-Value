//
//  UserDefaultsManager.swift
//  Labor-Value
//
//  Created by Douglas Rysdyk on 1/19/21.
//

import Foundation

class UserDefaultsManager {
    static let shared = UserDefaultsManager()
     
    let savedUserIncomeSuiteDefault = UserDefaults(suiteName: "savedUserIncomeSuite")
}
