//
//  APIRoutable.swift
//  TeamrKit
//
//  Created by Amir on 2023-09-11.
//

import Foundation
import Alamofire

public protocol APIRoutable {
    func asURLRequest() throws -> URLRequest
}

// Router that conforms to APIRoutable
// Makes requests and creates the pathing

enum APIRouter: APIRoutable {
    case getEmployees
    case getEmployeesMalformed
    case getEmployeesEmpty
}

private extension APIRouter {
    
    var method: HTTPMethod {
        switch self {
        case .getEmployees,
            .getEmployeesEmpty,
            .getEmployeesMalformed:
            return .get
        }
    }
}

private extension APIRouter {
    
    var baseURLPath: String {
        switch self {
            default: return "https://s3.amazonaws.com/sq-mobile-interview"
        }
    }
    
    var path: String {
        switch self {
        case .getEmployees: return "/employees.json"
        case .getEmployeesEmpty: return "/employees_empty.json"
        case .getEmployeesMalformed: return "/employees_malformed.json"
        }
    }
}

private extension APIRouter {
    
    // MARK: - Parameters
    
    var parameters: [String: Any] {
        switch self {
        default: // GETs
            return [:]
        }
    }
}

extension APIRouter {
    
    func asURLRequest() throws -> URLRequest {
        // Construct request

        var urlRequest = URLRequest(
            url: try baseURLPath.asURL().appendingPathComponent(path)
        )

        urlRequest.method = method
        urlRequest.timeoutInterval = 25

        switch self {
//        case .POST OR PATCH:
//            guard !parameters.isEmpty else { break }
//            urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)
        case .getEmployees,
            .getEmployeesEmpty,
            .getEmployeesMalformed: // GET
            break
        }

        return urlRequest
    }
}
