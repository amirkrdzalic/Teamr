//
//  Dependency.swift
//  TeamrKit
//
//  Created by Amir on 2023-09-12.
//

// MARK: - Chain of command architecture...
// https://refactoring.guru/design-patterns/chain-of-responsibility
/// Basically we dont care which we need, just let it pass through all until the appropriate repo is found...

open class Dependency: DependencyType {
    public init() {  }
    
    // MARK: - Network
    
    public func injectNetworkRepository() -> EmployeeNetworkRepositoryType {
        return EmployeeNetworkRepository(
            apiSession: injectService()
        )
    }
    
    // MARK: - Cache
    
//    public func injectCacheRepository() -> EmployeeCacheRepositoryType {
//        return EmployeeCacheRepositoryType
//    }
    
    // MARK: - Repo
    
    public func injectRepository() -> EmployeeRepositoryType {
        return EmployeeRepository(
            networkRepo: injectNetworkRepository()
        )
    }

    // MARK: - Services

    public func injectService() -> APISessionInterfaces {
        return APISession()
    }
}
