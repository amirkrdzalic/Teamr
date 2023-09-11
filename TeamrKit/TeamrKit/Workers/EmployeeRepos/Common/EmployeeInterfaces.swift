//
//  EmployeeInterfaces.swift
//  TeamrKit
//
//  Created by Amir on 2023-09-11.
//

public protocol EmployeeNetworkRepositoryType {
    func fetch(completion: @escaping (Result<[EmployeeType], DataError>) -> Void)
}

//public protocol EmployeeCacheRepositoryType { }

public protocol EmployeeRepositoryType: EmployeeNetworkRepositoryType {
    
}
