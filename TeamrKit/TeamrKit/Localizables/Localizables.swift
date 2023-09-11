//
//  Localizables.swift
//  TeamrKit
//
//  Created by Amir on 2023-09-11.
//

// Imported over for easability of localizables...

public extension Localizable {
    
    // Errors
    static let noInternetErrorMessage = Localizable(NSLocalizedString("no.internet.error.message", bundle: .sub, comment: "General error for no internet connection"))
    static let nonExistentErrorMessage = Localizable(NSLocalizedString("non.existent.error.message", bundle: .sub, comment: "General error for non existent data"))
    static let incompleteErrorMessage = Localizable(NSLocalizedString("incomplete.error.message", bundle: .sub, comment: "General error for incomplete entry"))
    static let unauthorizedErrorMessage = Localizable(NSLocalizedString("unauthorized.error.message", bundle: .sub, comment: "General error for unauthorized user"))
    static let timeoutErrorMessage = Localizable(NSLocalizedString("timeout.error.message", bundle: .sub, comment: "General error for timeout session"))
    static let parseFailureErrorMessage = Localizable(NSLocalizedString("parse.failure.error.message", bundle: .sub, comment: "General error for data parsing failure"))
    static let databaseFailureErrorMessage = Localizable(NSLocalizedString("database.failure.error.message", bundle: .sub, comment: "General error for database failure"))
    static let cacheFailureErrorMessage = Localizable(NSLocalizedString("cache.failure.error.message", bundle: .sub, comment: "General error for cache/storage failure"))
    static let networkFailureErrorMessage = Localizable(NSLocalizedString("network.failure.error.message", bundle: .sub, comment: "General error for network connection failure"))
    static let unknownReasonErrorMessage = Localizable(NSLocalizedString("unknown.reason.error.message", bundle: .sub, comment: "General error unknown condition of failure"))
    
    static let fieldPrefix = Localizable(NSLocalizedString("field.prefix", bundle: .sub, comment: "Used to preffix field name from server"))
}

