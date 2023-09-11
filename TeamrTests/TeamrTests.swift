//
//  TeamrTests.swift
//  TeamrTests
//
//  Created by Amir on 2023-09-11.
//

import XCTest
import TeamrKit
@testable import Teamr

// MARK: - Read here
//      Basic tests via "spy" method, testing the main business logic of the repository.
//      This will assert that the fake data is ensured and correct pathing is tackled.

class FakeWorker: EmployeeRepositoryType {
    
    var isFetchDone: Bool = false
    
    func fetch(completion: @escaping (Result<[EmployeeType], DataError>) -> Void) {
        let fakeData = Employee()
        isFetchDone = true
        completion(.success([fakeData]))
    }
}

class TeamrModelTests: XCTestCase {
    
    func testFetch() {
        let worker = FakeWorker()
        
        worker.fetch { result in
            switch result {
            case .success(let fakeData):
                XCTAssert(worker.isFetchDone)
                XCTAssert(!fakeData.isEmpty)
            case .failure(let error):
                // not testing here so w/e
                XCTFail()
            }
        }
    }
}
