//
//  DependencyInjector.swift
//  TeamrKit
//
//  Created by Amir on 2023-09-12.
//

public protocol DependencyInjectorType {
    var dependencies: DependencyType { get }
}

public extension DependencyInjectorType {
    
    var dependencies: DependencyType {
        return DependencyInjector.dependencies
    }
}

private struct DependencyInjector {
    static var dependencies: DependencyType = Dependency()
}

// MARK: - Swiftier way of implementing a singleton

public protocol DependencyConfigurator {  }

public extension DependencyConfigurator {

    func configure(with dependencies: DependencyType) {
        DependencyInjector.dependencies = dependencies
    }
}
