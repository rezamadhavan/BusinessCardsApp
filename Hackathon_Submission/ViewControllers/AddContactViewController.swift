//
//  AddContactViewController.swift
//  Hackathon_Submission
//
//  Created by Rodrigo Taipe on 4/21/19.
//  Copyright © 2019 Reza Madhavan. All rights reserved.
//

import UIKit

class AddContactViewController: UIViewController {

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
        code.textAlignment = .left
        code.font = .systemFont(ofSize: 20)
        code.borderStyle = .roundedRect
        code.backgroundColor = UIColor.lightGray
        view.addSubview(code)
        
        codeLabel = UILabel()
        codeLabel.textColor = .black
        codeLabel.text = "Code: "
        codeLabel.font = .systemFont(ofSize: 20)
        view.addSubview(codeLabel)
        
        addButton = UIButton()
        addButton.setTitle("Add", for: .normal)
        addButton.setTitleColor(.blue, for: .normal)
        addButton.addTarget(self, action: #selector(addContact), for: .touchUpInside)
        view.addSubview(addButton)
        
        
        setupConstraints()
        
    }
    
    func setupConstraints(){
        codeLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview().offset(-40)
            make.centerY.equalToSuperview().offset(-40)
        }
        
        code.snp.makeConstraints { make in
            make.leading.equalTo(codeLabel.snp.trailing)
            make.top.equalTo(codeLabel.snp.top)
            make.trailing.equalToSuperview().offset(-8)
        }
        
        addButton.snp.makeConstraints { make in
            make.top.equalTo(codeLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
    }
    
    @objc func addContact(){
        //TODO
    }
}
