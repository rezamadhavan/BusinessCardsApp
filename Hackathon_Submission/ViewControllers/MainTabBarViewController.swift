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
        
        let myProfileVC = MyProfileViewController()
        let addContactsVC = AddContactViewController()
        let viewContactsVC = ViewContactsViewController()
        
        myProfileVC.tabBarItem = UITabBarItem(tabBarSystemItem: .mostViewed , tag: 0)
        addContactsVC.tabBarItem = UITabBarItem(title: "Add", image: UIImage(named: "add_user"), tag: 1)
        viewContactsVC.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 2)
        
        let tabBarList = [myProfileVC, addContactsVC, viewContactsVC]
        
        self.viewControllers = tabBarList
    }
}
