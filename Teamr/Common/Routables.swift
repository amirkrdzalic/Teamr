//
//  Routables.swift
//  Teamr
//
//  Created by Amir on 2023-09-12.
//

import UIKit

// MARK: - Routables
//      All possible pathing around the app, part of the VIPER cycle. Although this app is 1 screen XD

enum Routables: String {
    case employeeDirectory = "EmployeeDirectoryViewController"
    
    /// Typical enum style and VC instantiation...
    func toViewController() -> UIViewController? {
        let storyboard = UIStoryboard(name: self.rawValue, bundle: nil)
        
        switch self {
        case .employeeDirectory:
            let viewController = storyboard.instantiateViewController(withIdentifier: self.rawValue) as? EmployeeDirectoryViewController
            return viewController
        }
    }
}
