//
//  ProfileView.swift
//  Hackathon_Submission
//
//  Created by Rodrigo Taipe on 4/21/19.
//  Copyright © 2019 Reza Madhavan. All rights reserved.
//

import UIKit

class ProfileView: UIView {
    var user: User?
    
    //View Elements
    let name = UILabel()
    let phoneNumber = UILabel()
    let email = UILabel()
    let company = UILabel()
    let img = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutUI()
    }
    
    func configure(with user: User){
        name.text = user.name
        phoneNumber.text = user.phoneNumber
        email.text = user.email
        company.text = user.company
        img.image = NetworkManager.downloadPicture(imageURL: user.imgURL)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func layoutUI(){
        self.backgroundColor = UIColor.red
    }
}
