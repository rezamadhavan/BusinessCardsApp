//
//  MyProfileViewController.swift
//  Hackathon_Submission
//
//  Created by Rodrigo Taipe on 4/21/19.
//  Copyright © 2019 Reza Madhavan. All rights reserved.
//

import UIKit

class MyProfileViewController: UIViewController {

    let screenRect = UIScreen.main.bounds
    
    var profileView : ProfileView!
    var user : User!
    
    let padding = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileView = ProfileView(frame: super.view.frame)
        title = "My Profile"
        
        user = User(id: 1234, name: "Reza Madhavan", phone: "123-456-789", email: "adfadf@gmail.com", company: "Cornell University", code: "RM855", imgURL: "", contacts: [])
        
        profileView.configure(with: user)
        
        self.view.addSubview(profileView)
        
        setupConstraints()
        
    }
    
    func setupConstraints(){
        self.view.backgroundColor = UIColor.white
        
        profileView.snp.makeConstraints{ make in
            make.centerX.centerY.equalToSuperview()
            make.top.equalTo(self.view.snp_topMargin).offset(padding)
            make.bottom.equalTo(self.view.snp_bottomMargin).offset(-padding)
            make.leading.equalTo(self.view.snp_leadingMargin).offset(padding)
            make.trailing.equalTo(self.view.snp_trailingMargin).offset(-padding)

        }
    }
    
    

}
