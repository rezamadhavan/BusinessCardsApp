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
    var nameLabel: UILabel!
    var emailLabel: UILabel!
    var companyLabel: UILabel!
    var phoneNumberLabel: UILabel!
    var codeLabel: UILabel!
    
    var name: UITextField!
    var phoneNumber: UITextField!
    var email: UITextField!
    var company: UITextField!
    var img: UIImageView!
    var code: UITextField!
    
    let padding: CGFloat = 8
    let height: CGFloat = 14
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        name = UITextField()
        name.isEnabled = true
        name.textColor = .black
        name.textAlignment = .left
        name.font = .systemFont(ofSize: 20)
        
        nameLabel = UILabel()
        nameLabel.textColor = .black
        nameLabel.text = "Name: "
        nameLabel.font = .systemFont(ofSize: 20)
        
        phoneNumber =  UITextField()
        phoneNumber.textColor = .black
        phoneNumber.isEnabled = true
        phoneNumber.textAlignment = .left
        phoneNumber.font = .systemFont(ofSize: 20)
        
        phoneNumberLabel = UILabel()
        phoneNumberLabel.textColor = .black
        phoneNumberLabel.text = "Phone #: "
        phoneNumberLabel.font = .systemFont(ofSize: 20)
        
        email =  UITextField()
        email.textColor = .black
        email.isEnabled = true
        email.textAlignment = .left
        email.font = .systemFont(ofSize: 20)
        
        emailLabel = UILabel()
        emailLabel.textColor = .black
        emailLabel.text = "Email: "
        emailLabel.font = .systemFont(ofSize: 20)
        
        company = UITextField()
        company.textColor = .black
        company.isEnabled = true
        company.textAlignment = .left
        company.font = .systemFont(ofSize: 20)
        
        companyLabel = UILabel()
        companyLabel.textColor = .black
        companyLabel.text = "Company: "
        companyLabel.font = .systemFont(ofSize: 20)
        
        img = UIImageView()
        
        code =  UITextField()
        code.textColor = .black
        code.font = .systemFont(ofSize: 20)
        code.textAlignment = .left
        
        codeLabel = UILabel()
        codeLabel.textColor = .black
        codeLabel.text = "Code: "
        codeLabel.font = .systemFont(ofSize: 20)
        
        self.addSubview(name)
        self.addSubview(phoneNumber)
        self.addSubview(email)
        self.addSubview(company)
        self.addSubview(img)
        self.addSubview(code)
        self.addSubview(nameLabel)
        self.addSubview(phoneNumberLabel)
        self.addSubview(emailLabel)
        self.addSubview(companyLabel)
        self.addSubview(codeLabel)
        
        layoutUI()
    }
    
    func configure(with user: User){
        name.text =  user.name
        phoneNumber.text =  user.phone
        email.text =  user.email
        company.text = user.company
        code.text = user.code
        img.image = NetworkManager.downloadPicture(imageURL: "https://www.guidedogs.org/wp-content/uploads/2015/05/Dog-Im-Not.jpg")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func layoutUI(){
        img.sizeThatFits(CGSize(width: 200, height: 200))
        
        img.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(150)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(padding)
            make.top.equalTo(img.snp.bottom).offset(padding)
        }
        
        name.snp.makeConstraints { make in
            make.leading.equalTo(nameLabel.snp.trailing).offset(padding)
            make.top.equalTo(nameLabel.snp.top)
            make.trailing.equalToSuperview().offset(-padding)
        }
        
        phoneNumberLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(padding)
            make.top.equalTo(nameLabel.snp.bottom).offset(padding)
        }
        
        phoneNumber.snp.makeConstraints { make in
            make.top.equalTo(name.snp.bottom).offset(padding)
            make.leading.equalTo(phoneNumberLabel.snp.trailing).offset(padding)
            make.trailing.equalToSuperview().offset(-padding)
        }
        
        emailLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(padding)
            make.top.equalTo(phoneNumberLabel.snp.bottom).offset(padding)
        }
        
        email.snp.makeConstraints { make in
            make.top.equalTo(phoneNumber.snp.bottom).offset(padding)
            make.leading.equalTo(emailLabel.snp.trailing).offset(padding)
            make.trailing.equalToSuperview().offset(-padding)
        }
        
        companyLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(padding)
            make.top.equalTo(emailLabel.snp.bottom).offset(padding)
        }
        
        company.snp.makeConstraints { make in
            make.top.equalTo(email.snp.bottom).offset(padding)
            make.leading.equalTo(companyLabel.snp.trailing).offset(padding)
            make.trailing.equalToSuperview().offset(-padding)
        }
        
        codeLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(padding)
            make.top.equalTo(companyLabel.snp.bottom).offset(padding)
        }
        
        code.snp.makeConstraints { make in
            make.top.equalTo(company.snp.bottom).offset(padding)
            make.leading.equalTo(codeLabel.snp.trailing).offset(padding)
            make.trailing.equalToSuperview().offset(-padding)
            //make.height.equalTo(height)
            
        }
        
    }
}
