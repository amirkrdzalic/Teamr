//
//  DataError.swift
//  TeamrKit
//
//  Created by Amir on 2023-09-11.
//

/*
 Final Error
 this Custom ErrorType will give an easy way to pass errors along or make some
 */

public enum DataError: Error {
    case nonExistent
    case incomplete
    case unauthorized
    case noInternet
    case timeout
    case parseFailure(Error?)
    case databaseFailure(Error?)
    case cacheFailure(Error?)
    case networkFailure(Error?)
    case unknownReason(Error?)
    case other(FieldErrors)
}

public extension DataError {
    
    init(from error: NetworkError?) {
        if let internalError = error?.internalError as? URLError {
            if internalError.code == .notConnectedToInternet {
                self = .noInternet
                return
            }
            else if internalError.code == .timedOut {
                self = .timeout
                return
            }
        }
        
        switch error?.statusCode {
        case 400?:
            self = .networkFailure(error)
        case 401?, 403?:
            self = .unauthorized
        default:
            self = .other(error?.fieldErrors ?? [:])
        }
    }
}

public extension DataError {
    
    var localizedDescription: String {
        switch self {
        case .nonExistent:
            return .localized(.nonExistentErrorMessage)
        case .incomplete:
            return .localized(.incompleteErrorMessage)
        case .unauthorized:
            return .localized(.unauthorizedErrorMessage)
        case .noInternet:
            return .localized(.noInternetErrorMessage)
        case .timeout:
            return .localized(.timeoutErrorMessage)
        case .parseFailure:
            return .localized(.parseFailureErrorMessage)
        case .databaseFailure:
            return .localized(.databaseFailureErrorMessage)
        case .cacheFailure:
            return .localized(.cacheFailureErrorMessage)
        case .networkFailure:
            return .localized(.networkFailureErrorMessage)
        case .unknownReason:
            return .localized(.unknownReasonErrorMessage)
        case .other(let fieldErrors):
            return parse(fieldErrors)
        }
    }
    
    private func parse(_ fieldErrors: FieldErrors) -> String {
        guard !fieldErrors.isEmpty else {
            return .localized(.unknownReasonErrorMessage)
        }
        
        return fieldErrors.reduce("") { result, next in
            guard next.key != "base" else {
                var output = result + next.value.joined(separator: " ")
                if !output.hasSuffix(".") { output += ". " }
                return output
            }
            
            let localizedKey: String = .localizedFormat(.fieldPrefix, next.key)
            
            return result + next.value
                .map { !$0.hasSuffix(".") ? "\(localizedKey) \($0). " : "\($0) " }
                .joined()
        }
    }
}
