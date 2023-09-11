//
//  NetworkError.swift
//  TeamrKit
//
//  Created by Amir on 2023-09-11.
//


/*
 Got to be able to get the errors that come from server and decode them from their headers
 'jsonData' - helper() - turns data to dic
 'scrubbed' - helper() - maps hash to dic
 */

public typealias FieldErrors = [String: [String]]

public struct NetworkError: Error {
    let urlRequest: URLRequest?
    let headerValues: [String: String]
    public let statusCode: Int
    public let fieldErrors: FieldErrors
    public let internalError: Error?
    
    public init(urlRequest: URLRequest?, headerValues: [String: String] = [String: String](), statusCode: Int, fieldErrors: FieldErrors = FieldErrors(), internalError: Error? = nil) {
        self.urlRequest = urlRequest
        self.statusCode = statusCode
        self.headerValues = headerValues
        self.fieldErrors = fieldErrors
        self.internalError = internalError
    }
    
    public init(urlRequest: URLRequest?, headerValues: [String: String], statusCode: Int, internalError: Error?, serverData: Data?) {
        let fieldErrors: FieldErrors = ((try? serverData?.jsonData(options: .allowFragments)) ?? nil)?["errors"] as? [String: [String]] ?? FieldErrors()
        
        self.init(urlRequest: urlRequest, headerValues: headerValues, statusCode: statusCode, fieldErrors: fieldErrors, internalError: internalError)
    }
}

extension NetworkError: CustomStringConvertible {
    
    public var description: String {
        return """
        \(internalError)
        Request: {
            url: \(urlRequest?.url?.absoluteString ?? ""),
            method: \(urlRequest?.httpMethod ?? ""),
            headers: \(urlRequest?.allHTTPHeaderFields?.scrubbed ?? [:]),
        },
        Response: {
            status: \(statusCode),
            body: \(fieldErrors),
            headers: \(headerValues.scrubbed)
        }
        """
    }
}
