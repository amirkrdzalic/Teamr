//
//  Localizable.swift
//  TeamrKit
//
//  Created by Amir on 2023-09-11.
//

import Foundation

// Imported over for easability of localizables...

public struct Localizable {
    fileprivate let rawValue: String
    
    public init(_ rawValue: String) {
        self.rawValue = rawValue
    }
}

public extension String {
    
    private static var msgListHandler: (_ key: String, _ arguments: CVaListPointer, _ locale: Locale?) -> String {
        return { return NSString(format: $0, locale: $2, arguments: $1) as String }
    }
    
    static func localized(_ key: Localizable) -> String {
        return key.rawValue
    }
    
    static func localizedFormat(_ key: Localizable, _ arguments: CVarArg...) -> String {
        return withVaList(arguments) { msgListHandler(key.rawValue, $0, nil) } as String
    }
    
    static func localizedLocale(_ key: Localizable, _ arguments: CVarArg...) -> String {
        return withVaList(arguments) { msgListHandler(key.rawValue, $0, .current) as String }
    }
}
