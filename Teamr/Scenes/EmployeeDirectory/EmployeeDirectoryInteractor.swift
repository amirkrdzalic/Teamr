//
//  EmployeeDirectoryInteractor.swift
//  Teamr
//
//  Created by Amir on 2023-09-12.
//

import TeamrKit

struct EmployeeDirectoryInteractor: EmployeeDirectoryBusinessLogic {
    
    private let employeeRepository: EmployeeRepositoryType
    private let presenter: EmployeeDirectoryPresentable
    
    init(employeeRepository: EmployeeRepositoryType, presenter: EmployeeDirectoryPresentable) {
        self.employeeRepository = employeeRepository
        self.presenter = presenter
    }
    
    // different routes depending on success/error...
    func fetch() {
        self.employeeRepository.fetch { result in // no [weak self] ever needed since its all structs...
            switch result {
            case .success(let response):
                self.presenter.present(with: response)
            case .failure(let error):
                self.presenter.present(with: error)
            }
        }
    }
}
