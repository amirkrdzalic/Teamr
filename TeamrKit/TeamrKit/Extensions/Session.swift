//
//  Session.swift
//  TeamrKit
//
//  Created by Amir on 2023-09-11.
//

import Alamofire

// Alamofire Session Manager Helper func

extension Session {

    func request(_ urlRequest: URLRequest, completion: @escaping (Result<ServerResponse, NetworkError>) -> Void) {
        request(urlRequest)
            .validate()
            .responseData {
                let statusCode = $0.response?.statusCode ?? 0
                let headers: [String: String] = {
                    guard let allHeaderFields = $0 else { return [:] }
                    return Dictionary(uniqueKeysWithValues: allHeaderFields.map {( String(describing: $0), String(describing: $1) )})
                }($0.response?.allHeaderFields)

                // Handle errors
                if statusCode == 204 {
                    guard $0.error == nil else {
                        let error = NetworkError(
                            urlRequest: $0.request,
                            headerValues: headers,
                            statusCode: statusCode,
                            internalError: $0.error,
                            serverData: $0.data
                        )

                        return completion(.failure(error))
                    }

                    completion(.success((Data(), headers, statusCode)))
                }
                else {
                    guard let value = $0.data, $0.error == nil else {
                        let error = NetworkError(
                            urlRequest: $0.request,
                            headerValues: headers,
                            statusCode: statusCode,
                            internalError: $0.error,
                            serverData: $0.data
                        )

                        return completion(.failure(error))
                    }

                    completion(.success((value, headers, statusCode)))
                }
        }
    }
}
