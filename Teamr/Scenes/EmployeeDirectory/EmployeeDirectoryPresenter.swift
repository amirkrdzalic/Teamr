//
//  EmployeeDirectoryPresenter.swift
//  Teamr
//
//  Created by Amir on 2023-09-12.
//

import UIKit
import TeamrKit

struct EmployeeDirectoryPresenter: EmployeeDirectoryPresentable {
    
    // Main responsibility is to filter, order etc. here and map out to the model needed...
    
    private let viewController: EmployeeDirectoryDisplayable?
    
    init(viewController: EmployeeDirectoryDisplayable?) {
        self.viewController = viewController
    }
}

// MARK: - Success

extension EmployeeDirectoryPresenter {
    
    func present(with employees: [EmployeeType]) {
        let mapped = employees.map { return make(from: $0) }.sorted { $0.name < $1.name }
        viewController?.display(with: mapped)
    }
}

// MARK: - Errors

extension EmployeeDirectoryPresenter {
    
    func present(with error: DataError) {
        viewController?.display(errorTitle: "Error!", errorMessage: error.localizedDescription)
    }
}

// MARK: - Helpers

private extension EmployeeDirectoryPresenter {
    
    func make(from object: EmployeeType) -> EmployeeDirectoryModels.EmployeeModel {
        return EmployeeDirectoryModels.EmployeeModel(
            uuid: object.uuid,
            name: object.name,
            phoneNumber: object.phoneNumber,
            email: object.email,
            bio: object.bio,
            photoSmall: object.photoSmall,
            photoLarge: object.photoLarge,
            team: object.team,
            employmentType: object.employmentType
        )
    }
}
