//
//  EmployeeDirectoryInterfaces.swift
//  Teamr
//
//  Created by Amir on 2023-09-12.
//

import TeamrKit

protocol EmployeeDirectoryBusinessLogic {
    func fetch()
}

protocol EmployeeDirectoryPresentable {
    func present(with employees: [EmployeeType])
    func present(with error: DataError)
}

protocol EmployeeDirectoryDisplayable {
    func display(with model: [EmployeeDirectoryModels.EmployeeModel])
    func display(errorTitle: String, errorMessage: String)
}

protocol EmployeeDirectoryRoutable {
    func route(to screen: Routables)
}
