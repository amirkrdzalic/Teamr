//
//  EmployeeType.swift
//  TeamrKit
//
//  Created by Amir on 2023-09-11.
//

public protocol EmployeeType {
    var uuid: String { get set }
    var name: String { get set }
    var phoneNumber: String? { get set }
    var email: String { get set }
    var bio: String? { get set }
    var photoSmall: String? { get set }
    var photoLarge: String? { get set }
    var team: String { get set }
    var employmentType: EmploymentType { get set }
    
    init()
}
