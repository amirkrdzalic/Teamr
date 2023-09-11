//
//  EmployeeNetworkRepository.swift
//  TeamrKit
//
//  Created by Amir on 2023-09-12.
//

struct EmployeeNetworkRepository: EmployeeNetworkRepositoryType {
    
    private let apiSession: APISessionInterfaces
    
    init(apiSession: APISessionInterfaces) {
        self.apiSession = apiSession
    }
    
    func fetch(completion: @escaping (Result<[EmployeeType], DataError>) -> Void) {
        
        // Alamofire will automatically handle the threading of the requests that go outbound
        apiSession.request(APIRouter.getEmployees) { result in
            
            // Send payload decoding etc. to another thread when API Call is complete
            DispatchQueue.global(qos: .userInitiated).async {
                switch result {
                case .success(let response):
                    do {
                        let payload = try JSONDecoder().decode(RawServerResponse.self, from: response.data).employees
                        
                        // Immediately return to main when done.
                        DispatchQueue.main.async { completion(.success(payload)) }
                    } catch {
                        DispatchQueue.main.async { completion(.failure(.parseFailure(nil))) }
                    }
                case .failure(let error):
                    let error = DataError(from: error)
                    DispatchQueue.main.async { completion(.failure(error)) }
                }
            }
        }
    }
}
