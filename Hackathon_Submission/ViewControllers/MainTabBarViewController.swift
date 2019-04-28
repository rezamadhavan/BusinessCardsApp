//
//  MainTabBarViewController.swift
//  Hackathon_Submission
//
//  Created by Rodrigo Taipe on 4/21/19.
//  Copyright © 2019 Reza Madhavan. All rights reserved.
//

import UIKit

//Using this link
//https://medium.com/ios-os-x-development/programmatically-creating-uitabbarcontroller-in-swift-e957cd35cfc4
class MainTabBarViewController: UITabBarController, UITabBarControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        
        
        let user = User(id: 1234, name: "Person A", phone: "123-456-789", email: "abc@gmail.com", company: "Google", code: "RM855", imgURL: "", contacts: [], position: "Software Engineer", website: "abc.com")
        
        let myProfileVC = MyProfileViewController(user: user, is_editable: true)
        let addContactsVC = AddContactViewController()
        let viewContactsVC = ViewContactsViewController()
        
        let navVC = UINavigationController(rootViewController: viewContactsVC)
        
        myProfileVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "user_male"), tag: 0)
        addContactsVC.tabBarItem = UITabBarItem(title: "Add", image: UIImage(named: "add_user"), tag: 1)
        navVC.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 2)
        let tabBarList = [myProfileVC, addContactsVC, navVC]
        
        
        setViewControllers(tabBarList, animated: false)
        self.viewControllers = tabBarList
        
    }
}

