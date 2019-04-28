//
//  ViewContactsViewController.swift
//  Hackathon_Submission
//
//  Created by Rodrigo Taipe on 4/21/19.
//  Copyright © 2019 Reza Madhavan. All rights reserved.
//

import UIKit

class ViewContactsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var user : User!
    
    let padding = 10
    
    var contactTableView : UITableView!
    var contacts : [User] = []
    let contactReuseId = "contactReuseId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blue
        title = "My Contacts"
        
        //create sample data
        user = User.init(id: 1234, name: "Reza Madhavan", phone: "123-456-789", email: "adfadf@gmail.com", company: "Cornell University", code: "RM855", imgURL: "", contacts: [], position: "Student", website: "www.reza.com")
        let sampleContact = User.init(id: 1234, name: "Test Contact", phone: "123-456-789", email: "adfadf@gmail.com", company: "Test Company", code: "RM855", imgURL: "", contacts: [], position: "sdfsd", website:"sdfs")
        for _ in 1...10 {
            user.contacts.append(sampleContact)
        }
        
        contacts = user.contacts
        
        contactTableView = UITableView()
        contactTableView.register(ContactTableViewCell.self, forCellReuseIdentifier: contactReuseId)
        contactTableView.backgroundColor = UIColor.white
        contactTableView.delegate = self
        contactTableView.dataSource = self
        
        view.addSubview(contactTableView)
        setupConstraints()
    }
    
    func setupConstraints(){
        self.view.backgroundColor = UIColor.white
        
        contactTableView.snp.makeConstraints{ make in
            make.centerX.centerY.equalTo(self.view.center)
            make.top.equalTo(self.view.snp_topMargin).offset(padding)
            make.bottom.equalTo(self.view.snp_bottomMargin).offset(padding)
            make.leading.equalTo(self.view.snp_leadingMargin).offset(padding)
            make.trailing.equalTo(self.view.snp_trailingMargin).offset(padding)
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: contactReuseId, for: indexPath) as! ContactTableViewCell
        let contact = contacts[indexPath.row]
        cell.infoLabel.text = "\(contact.name) • \(contact.company)"
        cell.backgroundColor = .white
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let contact = contacts[indexPath.row]
        let myProfVC = MyProfileViewController(user: contact, is_editable: false)
        self.navigationController?.pushViewController(myProfVC, animated: false)
    }
}
