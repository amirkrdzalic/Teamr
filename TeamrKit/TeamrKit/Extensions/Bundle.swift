//
//  Bundle.swift
//  TeamrKit
//
//  Created by Amir on 2023-09-11.
//

public extension Bundle {
    private class ClassForBundle { }
    
    /// A representation of the code and files stored in TeamrSub on disk.
    static var sub: Bundle {
        return Bundle(for: ClassForBundle.self)
    }
    
    func contents(plist: String, inDirectory directory: String? = nil) -> [String: Any] {
        guard let resourcePath = path(forResource: plist, ofType: nil, inDirectory: directory), let contents = NSDictionary(contentsOfFile: resourcePath) as? [String: Any] else {
            return [:]
        }
        
        return contents
    }
}
