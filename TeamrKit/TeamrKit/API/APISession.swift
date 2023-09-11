//
//  APISession.swift
//  TeamrKit
//
//  Created by Amir on 2023-09-11.
//

import Alamofire

public typealias ServerResponse = (data: Data, headers: [String: String], statusCode: Int)

public protocol APISessionInterfaces {
    func request(_ route: APIRoutable, completion: @escaping (Result<ServerResponse, NetworkError>) -> Void)
}

struct APISession: APISessionInterfaces {
    private let sessionManager: Session
    
    init() {
        let configuration = URLSessionConfiguration.default
        self.sessionManager = Session(configuration: configuration)
    }
    
    public func request(_ route: APIRoutable, completion: @escaping (Result<ServerResponse, NetworkError>) -> Void) {
        var urlRequest: URLRequest
        
        // Construct request
        do {
            urlRequest = try route.asURLRequest()
            // Set some headers
            urlRequest.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        }
        catch {
            return completion(.failure(NetworkError(urlRequest: nil, statusCode: 400)))
        }
        
        sessionManager.request(urlRequest) {
            completion($0)
        }
    }
}
