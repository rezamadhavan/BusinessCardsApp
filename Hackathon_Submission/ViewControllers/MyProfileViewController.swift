//
//  MyProfileViewController.swift
//  Hackathon_Submission
//
//  Created by Rodrigo Taipe on 4/21/19.
//  Copyright © 2019 Reza Madhavan. All rights reserved.
//

import UIKit

class MyProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blue
        
        let profileView = ProfileView(frame: self.view.frame)
        self.view.addSubview(profileView)
        // Do any additional setup after loading the view.
        
        let user = User.init(id: 1234, name: "Reza Madhavan", phone: "123-456-789", email: "adfadf@gmail.com", company: "Cornell University", code: "RM855", imgURL: "", contacts: [])
        
        profileView.configure(with: user)
    }
    
    

}
