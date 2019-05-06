//
//  AppData.swift
//  Hackathon_Submission
//
//  Created by Reza Madhavan on 5/5/19.
//  Copyright © 2019 Reza Madhavan. All rights reserved.
//

import Foundation

class AppData {
    private static let defaults = UserDefaults.standard

    static func updateUser(user: User){
        defaults.set(user.name, forKey: UserDefaultKeys.name.rawValue)
        defaults.set(user.email, forKey: UserDefaultKeys.email.rawValue)
        defaults.set(user.phone, forKey: UserDefaultKeys.phone.rawValue)
        defaults.set(user.company, forKey: UserDefaultKeys.company.rawValue)
        defaults.set(user.position, forKey: UserDefaultKeys.position.rawValue)
        defaults.set(user.website, forKey: UserDefaultKeys.website.rawValue)
        
    }
}
