//
//  AddContactViewController.swift
//  Hackathon_Submission
//
//  Created by Rodrigo Taipe on 4/21/19.
//  Copyright © 2019 Reza Madhavan. All rights reserved.
//

import UIKit

class AddContactViewController: UIViewController {
    
    let padding = 50
    let smallPadding = 10
    let standardBlue: UIColor = UIColor.init(red: 0, green: 122/256, blue: 255/256, alpha: 1)
    
    var codeLabel: UILabel!
    var code: UITextField!
    var addButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        
        code = UITextField()
        code.isEnabled = true
        code.textColor = .black
        code.textAlignment = .center
        code.font = .systemFont(ofSize: 20)
        code.borderStyle = .roundedRect
        code.backgroundColor = UIColor.lightGray
        view.addSubview(code)
        
        codeLabel = UILabel()
        codeLabel.textColor = .black
        codeLabel.text = "Enter Code"
        codeLabel.textAlignment = .center
        codeLabel.font = .systemFont(ofSize: 20)
        view.addSubview(codeLabel)
        
        addButton = UIButton()
        addButton.setTitle("Add", for: .normal)
        addButton.setTitleColor(.white, for: .normal)
        addButton.backgroundColor = standardBlue
        addButton.addTarget(self, action: #selector(addContact), for: .touchUpInside)
        view.addSubview(addButton)
        
        setupConstraints()
        
    }
    
    func setupConstraints(){
        codeLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(-40)
            make.leading.equalToSuperview().offset(padding)
            make.trailing.equalToSuperview().offset(-padding)
        }
        
        code.snp.makeConstraints { make in
            make.top.equalTo(codeLabel.snp.bottom).offset(smallPadding)
            make.leading.equalToSuperview().offset(padding)
            make.trailing.equalToSuperview().offset(-padding)
        }
        
        addButton.snp.makeConstraints { make in
            make.top.equalTo(code.snp.bottom).offset(smallPadding)
            make.leading.equalToSuperview().offset(padding)
            make.trailing.equalToSuperview().offset(-padding)
        }
    }
    
    @objc func addContact(){
        NetworkManager.addContact(their_code: code.text!){
            (user) in
            print(user?.name)
        }
        
    }
}
