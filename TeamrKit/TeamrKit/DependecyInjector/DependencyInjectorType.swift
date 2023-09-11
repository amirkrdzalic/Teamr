//
//  DependencyInjectorType.swift
//  TeamrKit
//
//  Created by Amir on 2023-09-12.
//

public protocol DependencyType {
    
    // MARK: - Network Repos
    
    func injectNetworkRepository() -> EmployeeNetworkRepositoryType
    
    // MARK: - Cache Repos
    
//    func injectCacheRepository() -> EmployeeCacheRepositoryType
    
    // MARK: - Repos
    
    func injectRepository() -> EmployeeRepositoryType
    
    // MARK: - Services
    
    func injectService() -> APISessionInterfaces
}
