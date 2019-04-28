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
    var positionLabel: UILabel!
    var websiteLabel: UILabel!
    
    var name: UITextField!
    var phoneNumber: UITextField!
    var email: UITextField!
    var company: UITextField!
    var img: UIImageView!
    var code: UITextField!
    var position: UITextField!
    var website: UITextField!
    
    var uploadPicButton: UIButton!
    var updateProfileButton: UIButton!
    
    let smallPadding: CGFloat = 2
    let padding: CGFloat = 16
    let standardBlue: UIColor = UIColor.init(red: 0, green: 122/256, blue: 255/256, alpha: 1)
    
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
        
        position = UITextField()
        position.isEnabled = true
        position.textColor = .black
        position.textAlignment = .left
        position.font = .systemFont(ofSize: 20)
        
        positionLabel = UILabel()
        positionLabel.textColor = .black
        positionLabel.text = "Position: "
        positionLabel.font = .systemFont(ofSize: 20)
        
        
        phoneNumber =  UITextField()
        phoneNumber.textColor = .black
        phoneNumber.isEnabled = true
        phoneNumber.textAlignment = .left
        phoneNumber.font = .systemFont(ofSize: 20)
        
        phoneNumberLabel = UILabel()
        phoneNumberLabel.textColor = .black
        phoneNumberLabel.text = "Phone: "
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
        
        website =  UITextField()
        website.textColor = .black
        website.isEnabled = true
        website.textAlignment = .left
        website.font = .systemFont(ofSize: 20)
        
        websiteLabel = UILabel()
        websiteLabel.textColor = .black
        websiteLabel.text = "Website: "
        websiteLabel.font = .systemFont(ofSize: 20)
        
        
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
        code.isEnabled = false
        
        codeLabel = UILabel()
        codeLabel.textColor = .black
        codeLabel.text = "Code: "
        codeLabel.font = .systemFont(ofSize: 20)
        
        uploadPicButton = UIButton()
        uploadPicButton.setTitle("Upload Picture", for: .normal)
        uploadPicButton.setTitleColor(.white, for: .normal)
        uploadPicButton.backgroundColor = standardBlue
        
        updateProfileButton = UIButton()
        updateProfileButton.setTitle("Update", for: .normal)
        updateProfileButton.setTitleColor(.white, for: .normal)
        updateProfileButton.backgroundColor = standardBlue
        //        uploadPicButton.addTarget(self, action: #selector(pressUploadPicButton), for: .touchUpInside)
        
        addSubviews()
        layoutPortraitUI()
    }
    
    func configure(with user: User){
        name.text =  user.name
        phoneNumber.text =  user.phone
        email.text =  user.email
        company.text = user.company
        code.text = user.code
        img.image = NetworkManager.downloadPicture(imageURL: "https://www.guidedogs.org/wp-content/uploads/2015/05/Dog-Im-Not.jpg")
        position.text = user.position
        website.text = user.website
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func addSubviews(){
        self.addSubview(name)
        self.addSubview(phoneNumber)
        self.addSubview(email)
        self.addSubview(company)
        self.addSubview(img)
        self.addSubview(code)
        self.addSubview(position)
        self.addSubview(website)
        self.addSubview(nameLabel)
        self.addSubview(phoneNumberLabel)
        self.addSubview(emailLabel)
        self.addSubview(companyLabel)
        self.addSubview(codeLabel)
        self.addSubview(positionLabel)
        self.addSubview(websiteLabel)
        self.addSubview(uploadPicButton)
        self.addSubview(updateProfileButton)
    }
    
    func enableFields(){
        name.isEnabled = true
        phoneNumber.isEnabled = true
        email.isEnabled = true
        company.isEnabled = true
        code.isEnabled = true
        position.isEnabled = true
        website.isEnabled = true
    }
    
    func disableFields(){
        name.isEnabled = false
        phoneNumber.isEnabled = false
        email.isEnabled = false
        company.isEnabled = false
        code.isEnabled = false
        position.isEnabled = false
        website.isEnabled = false
    }
    
    func reAddSubviews(){
        name.removeFromSuperview()
        phoneNumber.removeFromSuperview()
        email.removeFromSuperview()
        company.removeFromSuperview()
        img.removeFromSuperview()
        code.removeFromSuperview()
        position.removeFromSuperview()
        website.removeFromSuperview()
        nameLabel.removeFromSuperview()
        phoneNumberLabel.removeFromSuperview()
        emailLabel.removeFromSuperview()
        companyLabel.removeFromSuperview()
        codeLabel.removeFromSuperview()
        positionLabel.removeFromSuperview()
        websiteLabel.removeFromSuperview()
        addSubviews()
    }
    
    func layoutLandscapeUI(){
        reAddSubviews()
        disableFields()
        nameLabel.isHidden = true
        positionLabel.isHidden = true
        uploadPicButton.isHidden = true
        updateProfileButton.isHidden = true
        
        companyLabel.text = "@"
        emailLabel.text = "📧 "
        phoneNumberLabel.text = "📞 "
        websiteLabel.text = "🌎 "
        
        img.sizeThatFits(CGSize(width: 200, height: 200))
        
        img.snp.makeConstraints{ make in
                make.leading.equalTo(self.snp.centerX)
                make.centerY.equalToSuperview()
        }
        
        name.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(padding*2)
            make.leading.equalToSuperview().offset(padding)
        }
        
        position.snp.makeConstraints{ make in
            make.top.equalTo(name.snp.bottom).offset(padding)
            make.leading.equalTo(name.snp.leading)
        }
        
        companyLabel.snp.makeConstraints{ make in
            make.top.equalTo(position.snp.top)
            make.leading.equalTo(position.snp.trailing).offset(smallPadding)
        }
        
        company.snp.makeConstraints{ make in
            make.top.equalTo(position.snp.top)
            make.leading.equalTo(companyLabel.snp.trailing).offset(smallPadding)
        }
        
        emailLabel.snp.makeConstraints{ make in
            make.top.equalTo(position.snp.bottom).offset(padding)
            make.leading.equalTo(name.snp.leading)
        }
        
        email.snp.makeConstraints{ make in
            make.leading.equalTo(emailLabel.snp.trailing).offset(smallPadding)
            make.top.equalTo(emailLabel.snp.top)
        }
        
        phoneNumberLabel.snp.makeConstraints{ make in
            make.top.equalTo(emailLabel.snp.bottom).offset(padding)
            make.leading.equalTo(emailLabel.snp.leading)
        }
        
        phoneNumber.snp.makeConstraints{ make in
            make.leading.equalTo(phoneNumberLabel.snp.trailing).offset(smallPadding)
            make.top.equalTo(phoneNumberLabel.snp.top)
        }
        
        websiteLabel.snp.makeConstraints{ make in
            make.top.equalTo(phoneNumberLabel.snp.bottom).offset(padding)
            make.leading.equalTo(phoneNumberLabel.snp.leading)
        }
        
        website.snp.makeConstraints{ make in
            make.leading.equalTo(websiteLabel.snp.trailing).offset(smallPadding)
            make.top.equalTo(websiteLabel.snp.top)
        }
        
        codeLabel.snp.makeConstraints{ make in
            make.top.equalTo(websiteLabel.snp.bottom).offset(padding)
            make.leading.equalTo(websiteLabel.snp.leading)
        }
        
        code.snp.makeConstraints{ make in
            make.leading.equalTo(codeLabel.snp.trailing).offset(smallPadding)
            make.top.equalTo(codeLabel.snp.top)
        }
        
        
        
    }
    
    func layoutPortraitUI(){
        reAddSubviews()
        enableFields()
        nameLabel.isHidden = false
        positionLabel.isHidden = false

        uploadPicButton.isHidden = false
        updateProfileButton.isHidden = false
        
        companyLabel.text = "Company: "
        emailLabel.text = "Email: "
        phoneNumberLabel.text = "Phone: "
        websiteLabel.text = "Website: "
        
        img.sizeThatFits(CGSize(width: 200, height: 200))
        
        img.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(150)
        }
        
        uploadPicButton.snp.makeConstraints{ make in
            make.top.equalTo(img.snp.bottom)
            make.leading.equalTo(img.snp.leading)
            make.trailing.equalTo(img.snp.trailing)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.leading.equalTo(img.snp.leading)
            make.top.equalTo(uploadPicButton.snp.bottom).offset(padding)
        }
        
        name.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.top)
            make.leading.equalTo(nameLabel.snp.trailing).offset(padding)
        }
        
        positionLabel.snp.makeConstraints { make in
            make.leading.equalTo(nameLabel.snp.leading)
            make.top.equalTo(nameLabel.snp.bottom).offset(padding)
        }
        
        position.snp.makeConstraints { make in
            make.top.equalTo(positionLabel.snp.top)
            make.leading.equalTo(positionLabel.snp.trailing).offset(padding)
            //make.height.equalTo(height)
        }
        
        companyLabel.snp.makeConstraints { make in
            make.leading.equalTo(nameLabel.snp.leading)
            make.top.equalTo(positionLabel.snp.bottom).offset(padding)
        }
        
        company.snp.makeConstraints { make in
            make.top.equalTo(companyLabel.snp.top)
            make.leading.equalTo(companyLabel.snp.trailing).offset(padding)
        }
        
        phoneNumberLabel.snp.makeConstraints { make in
            make.leading.equalTo(nameLabel.snp.leading)
            make.top.equalTo(companyLabel.snp.bottom).offset(padding)
        }
        
        phoneNumber.snp.makeConstraints { make in
            make.top.equalTo(phoneNumberLabel.snp.top)
            make.leading.equalTo(phoneNumberLabel.snp.trailing).offset(padding)
        }
        
        emailLabel.snp.makeConstraints { make in
            make.leading.equalTo(nameLabel.snp.leading)
            make.top.equalTo(phoneNumberLabel.snp.bottom).offset(padding)
        }
        
        email.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.top)
            make.leading.equalTo(emailLabel.snp.trailing).offset(padding)
        }
        
        websiteLabel.snp.makeConstraints { make in
            make.leading.equalTo(nameLabel.snp.leading)
            make.top.equalTo(emailLabel.snp.bottom).offset(padding)
        }
        
        website.snp.makeConstraints { make in
            make.top.equalTo(websiteLabel.snp.top)
            make.leading.equalTo(websiteLabel.snp.trailing).offset(padding)
        }
        
        codeLabel.snp.makeConstraints { make in
            make.leading.equalTo(nameLabel.snp.leading)
            make.top.equalTo(websiteLabel.snp.bottom).offset(padding)
        }
        
        code.snp.makeConstraints { make in
            make.top.equalTo(codeLabel.snp.top)
            make.leading.equalTo(codeLabel.snp.trailing).offset(padding)
        }
        
        updateProfileButton.snp.makeConstraints { make in
            make.top.equalTo(code.snp.bottom).offset(padding)
            make.leading.equalTo(img.snp.leading)
            make.trailing.equalTo(img.snp.trailing)
        }
    }
    
    
}
