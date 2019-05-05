//
//  MyProfileViewController.swift
//  Hackathon_Submission
//
//  Created by Rodrigo Taipe on 4/21/19.
//  Copyright © 2019 Reza Madhavan. All rights reserved.
//

import UIKit

class MyProfileViewController: UIViewController, UIImagePickerControllerDelegate {

    let screenRect = UIScreen.main.bounds
    
    var profileView : ProfileView!
    var user : User!
    var editable: Bool!
    let padding = 10
    
    //image picking
    let imagePicker = UIImagePickerController()
    
    init(user: User, is_editable: Bool) {
        self.user = user
        self.editable = is_editable
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileView = ProfileView(frame: super.view.frame)
        title = "Profile"
        
        profileView.configure(with: user)
        
        self.view.addSubview(profileView)
        
        if !editable {
            profileView.disableFields()
            profileView.uploadPicButton.isHidden = true
            profileView.updateProfileButton.isHidden = true
        }
        
        profileView.uploadPicButton.addTarget(self, action: #selector(pressUploadPicButton), for: .touchUpInside)
        
    
        
        setupConstraints()
        
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if UIDevice.current.orientation.isLandscape {
            print("Landscape")
            self.tabBarController?.tabBar.isHidden = true
            profileView.layoutLandscapeUI()
        } else {
            print("Portrait")
            self.tabBarController?.tabBar.isHidden = false
            profileView.layoutPortraitUI()
        }
        if !editable {
            profileView.disableFields()
            profileView.uploadPicButton.isHidden = true
            profileView.updateProfileButton.isHidden = true
        }
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
    
    //image uploading
    @objc func pressUploadPicButton(){
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            self.profileView.img.image = pickedImage
            dismiss(animated: true, completion: nil)
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
