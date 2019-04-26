//
//  ProfileView.swift
//  Hackathon_Submission
//
//  Created by Rodrigo Taipe on 4/21/19.
//  Copyright © 2019 Reza Madhavan. All rights reserved.
//

import UIKit
import SnapKit

class ProfileView: UIView {
    var user: User!
    
    //View Elements
    var name: UITextField!
    var phoneNumber: UILabel!
    var email: UILabel!
    var company: UILabel!
    var img: UIImageView!
    var code: UILabel!
    let padding: CGFloat = 8
    let height: CGFloat = 14
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        name = UITextField()
        name.isEnabled = true
        name.textColor = .black
        name.font = .systemFont(ofSize: 14)
        
        phoneNumber = UILabel()
        phoneNumber.textColor = .black
        phoneNumber.font = .systemFont(ofSize: 14)
        
        email = UILabel()
        email.textColor = .black
        email.font = .systemFont(ofSize: 14)
        
        company = UILabel()
        company.textColor = .black
        company.font = .systemFont(ofSize: 14)
        
        img = UIImageView()
        
        code = UILabel()
        code.textColor = .black
        code.font = .systemFont(ofSize: 14)
        
        self.addSubview(name)
        self.addSubview(phoneNumber)
        self.addSubview(email)
        self.addSubview(company)
        self.addSubview(img)
        self.addSubview(code)
        
        layoutUI()
    }
    
    func configure(with user: User){
        name.text = user.name
        phoneNumber.text = user.phone
        email.text = user.email
        company.text = user.company
        img.image = NetworkManager.downloadPicture(imageURL: user.imgURL)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func layoutUI(){
        name.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().offset(padding)
            make.height.equalTo(height)
        }
        
        phoneNumber.snp.makeConstraints { make in
            make.top.equalTo(name.snp.bottom).offset(padding)
            make.height.equalTo(height)
        }
        
        email.snp.makeConstraints { make in
            make.top.equalTo(phoneNumber.snp.bottom).offset(padding)
            make.height.equalTo(height)
        }
        
        company.snp.makeConstraints { make in
            make.top.equalTo(email.snp.bottom).offset(padding)
            make.height.equalTo(height)
        }
        
        code.snp.makeConstraints { make in
            make.top.equalTo(company.snp.bottom).offset(padding)
            make.height.equalTo(height)
        }
        
    }
}
