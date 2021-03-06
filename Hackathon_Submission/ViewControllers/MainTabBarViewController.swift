//
//  MainTabBarViewController.swift
//  Hackathon_Submission
//
//  Created by Rodrigo Taipe on 4/21/19.
//  Copyright © 2019 Reza Madhavan. All rights reserved.
//

import UIKit

//Using this link - link is useful
//https://medium.com/ios-os-x-development/programmatically-creating-uitabbarcontroller-in-swift-e957cd35cfc4
class MainTabBarViewController: UITabBarController, UITabBarControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        let defaults = UserDefaults.standard
        
        
//        let user = User(id: 1234, name: "Person A", phone: "123-456-789", email: "abc@gmail.com", company: "Google", code: "RM855", imgURL: "", contacts: [], position: "Software Engineer", website: "abc.com")
        
        let user = User(id: defaults.integer(forKey: UserDefaultKeys.id.rawValue), name: defaults.string(forKey: UserDefaultKeys.name.rawValue)!, phone: defaults.string(forKey: UserDefaultKeys.phone.rawValue)!, email: defaults.string(forKey: UserDefaultKeys.email.rawValue)!, company: defaults.string(forKey: UserDefaultKeys.company.rawValue)!, code: defaults.string(forKey: UserDefaultKeys.code.rawValue)!, imgURL:defaults.string(forKey: UserDefaultKeys.imgURL.rawValue)!, contacts: [], position: defaults.string(forKey: UserDefaultKeys.position.rawValue)!, website: defaults.string(forKey: UserDefaultKeys.website.rawValue)!)
        
        //defaults.string(forKey: UserDefaultKeys.name.rawValue)!
        
        let myProfileVC = MyProfileViewController(user: user, is_editable: true)
        let addContactsVC = AddContactViewController()
        let viewContactsVC = ViewContactsViewController()
        
        let navVC1 = UINavigationController(rootViewController: myProfileVC)
        let navVC2 = UINavigationController(rootViewController: viewContactsVC)
        
        myProfileVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "user_male"), tag: 0)
        addContactsVC.tabBarItem = UITabBarItem(title: "Add", image: UIImage(named: "add_user"), tag: 1)
        navVC2.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 2)
        let tabBarList = [navVC1, addContactsVC, navVC2]
        
        
        setViewControllers(tabBarList, animated: false)
        self.viewControllers = tabBarList
        
    }
}

