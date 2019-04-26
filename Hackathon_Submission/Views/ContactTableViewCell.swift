//
//  ContactTableViewCell.swift
//  Hackathon_Submission
//
//  Created by Rodrigo Taipe on 4/25/19.
//  Copyright © 2019 Reza Madhavan. All rights reserved.
//

import UIKit
import SnapKit

class ContactTableViewCell: UITableViewCell {
    var infoLabel: UILabel!
    
    let padding: CGFloat = 8
    let height: CGFloat = 14
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        infoLabel = UILabel()
        infoLabel.textColor = .black
        infoLabel.font = .systemFont(ofSize: 14)
        addSubview(infoLabel)
        
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints(){
        infoLabel.snp.makeConstraints{ make in
            make.leading.top.equalToSuperview().offset(padding)
            make.height.equalTo(height)
        }
    }

}
