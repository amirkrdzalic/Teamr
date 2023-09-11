//
//  Employee.swift
//  TeamrKit
//
//  Created by Amir on 2023-09-12.
//

import Foundation

public struct Employee: Decodable, EmployeeType {
    public var uuid: String = UUID().uuidString
    public var name: String = ""
    public var phoneNumber: String?
    public var email: String = ""
    public var bio: String?
    public var photoSmall: String?
    public var photoLarge: String?
    public var team: String = ""
    public var employmentType: EmploymentType = .partTime
    
    public init() { }
    
    public init(
        uuid: String,
        name: String,
        phoneNumber: String?,
        email: String,
        bio: String?,
        photoSmall: String?,
        photoLarge: String?,
        team: String,
        employmentType: EmploymentType
    ) {
        self.uuid = uuid
        self.name = name
        self.phoneNumber = phoneNumber
        self.email = email
        self.bio = bio
        self.photoSmall = photoSmall
        self.photoLarge = photoLarge
        self.team = team
        self.employmentType = employmentType
    }
}

private extension Employee {
    
    enum CodingKeys: String, CodingKey {
        case uuid
        case name = "full_name"
        case phoneNumber = "phone_number"
        case email = "email_address"
        case bio = "biography"
        case photoSmall = "photo_url_small"
        case photoLarge = "photo_url_large"
        case team
        case employmentType = "employee_type"
    }
}

extension Employee {
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        uuid = try container.decode(String.self, forKey: .uuid)
        name = try container.decode(String.self, forKey: .name)
        phoneNumber = try container.decodeIfPresent(String.self, forKey: .phoneNumber)
        email = try container.decode(String.self, forKey: .email)
        bio = try container.decodeIfPresent(String.self, forKey: .bio)
        photoSmall = try container.decodeIfPresent(String.self, forKey: .photoSmall)
        photoLarge = try container.decodeIfPresent(String.self, forKey: .photoLarge)
        team = try container.decode(String.self, forKey: .team)
        
        let employment = try container.decode(String.self, forKey: .employmentType)
        employmentType = EmploymentType(rawValue: employment) ?? .fullTime
    }
}
