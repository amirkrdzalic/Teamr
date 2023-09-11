//
//  RawServerResponse.swift
//  TeamrKit
//
//  Created by Amir on 2023-09-12.
//

struct RawServerResponse {
    
    // We have a key holding the array of epmloyees in the JSON Hash...
    // it isnt necessary, but since its there, we can use this acting like a container to decode and...
    // gain access to the array, which is in essence all we need.
    
    // Also in the future, if we have more situations like this, we can add the expected type...
    // as a variable here just like how we are doing for employees.
    
    enum RootKeys: String, CodingKey {
        case employees
    }
    
    var employees: [EmployeeType]
}

extension RawServerResponse: Decodable {

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: RootKeys.self)
        employees = try container.decode([Employee].self, forKey: .employees)
    }
}
