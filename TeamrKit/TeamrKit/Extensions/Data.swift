//
//  Data.swift
//  TeamrKit
//
//  Created by Amir on 2023-09-11.
//

// MARK: ~ Helpers to convert to dictionaries

extension Data {
    
    func jsonData(options: JSONSerialization.ReadingOptions = []) throws -> [String: Any] {
        guard let object = try JSONSerialization.jsonObject(with: self, options: options) as? [String: Any]
            else { return [:] }
        
        return object
    }
    
    func jsonArray(options: JSONSerialization.ReadingOptions = []) throws -> [Any] {
        guard let object = try JSONSerialization.jsonObject(with: self, options: options) as? [Any]
            else { return [] }
        
        return object
    }
}

fileprivate extension Dictionary {
    
    /// Keys to scrub
    
    static var scrubKeys: [String] {
        return [
            "Authorization",
            "Set-Cookie",
            "user_email",
            "password",
            "first_name",
            "last_name",
            "email",
            "phone_number",
            "profile_picture_url",
            "token"
        ]
    }
    
    static func scrub(value: [AnyHashable: Any]) -> [String: String] {
        return Dictionary<String, String>(uniqueKeysWithValues: value.map {
            let key = "\($0)"
            let value = !key.within(scrubKeys) || ($1 as? String)?.isEmpty == true ? "\($1)" : "*****"
            return (key, value)
        })
    }
}

extension Dictionary where Key == AnyHashable, Value == Any {
    
    /// Remove sensitive info from headers
    
    var scrubbed: [String: String] {
        return Dictionary.scrub(value: self)
    }
}


extension Dictionary where Key == String, Value == String {
    
    /// Remove sensitive info from headers
    
    var scrubbed: [String: String] {
        return Dictionary.scrub(value: self)
    }
}

public extension Equatable {
    
    func within<Seq: Sequence> (_ values: Seq) -> Bool where Seq.Iterator.Element == Self {
        return values.contains(self)
    }
}
