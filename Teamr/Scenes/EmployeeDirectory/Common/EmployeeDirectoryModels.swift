//
//  EmployeeDirectoryModels.swift
//  Teamr
//
//  Created by Amir on 2023-09-12.
//

import TeamrKit

enum EmployeeDirectoryModels {
    
    struct EmployeeModel {
        var uuid: String
        var name: String
        var phoneNumber: String?
        var email: String
        var bio: String?
        var photoSmall: String?
        var photoLarge: String?
        var team: String
        var employmentType: EmploymentType
    }
}
