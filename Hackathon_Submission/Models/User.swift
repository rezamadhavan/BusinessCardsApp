//
//  User.swift
//  Hackathon_Submission
//
//  Created by Reza Madhavan on 4/20/19.
//  Copyright © 2019 Reza Madhavan. All rights reserved.
//

import Foundation

struct User: Codable{
    var id: Int
    var name: String
    var phone: String
    var email: String
    var company: String
    var code: String
    var imgURL: String
    var contacts: [User]
    var position: String
    var website: String
}

struct UserDataResponse: Codable {
    var success : Bool
    var data : User
}
