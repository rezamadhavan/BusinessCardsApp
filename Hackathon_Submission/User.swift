//
//  User.swift
//  Hackathon_Submission
//
//  Created by Reza Madhavan on 4/20/19.
//  Copyright © 2019 Reza Madhavan. All rights reserved.
//

import Foundation

struct User:Decodable{
    var name: String
    var phoneNumber: String
    var email: String
    var company: String
    var code: String
    var img: String
    var contacts: [User]
}

struct UserDataResponse : Codable {
    var data : User
}
