//
//  EmployeeRepository.swift
//  TeamrKit
//
//  Created by Amir on 2023-09-11.
//

struct EmployeeRepository: EmployeeRepositoryType {
    
    private let networkRepo: EmployeeNetworkRepositoryType
    
    init(networkRepo: EmployeeNetworkRepositoryType) {
        self.networkRepo = networkRepo
    }
    
    // If there was a cache repo here, we would do a differential func to update the data or show cached etc.
    // Lots can be done here.
    
    func fetch(completion: @escaping (Result<[EmployeeType], DataError>) -> Void) {
        networkRepo.fetch { result in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
