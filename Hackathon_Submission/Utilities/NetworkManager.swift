//
//  NetworkManager.swift
//  Hackathon_Submission
//
//  Created by Reza Madhavan on 4/20/19.
//  Copyright © 2019 Reza Madhavan. All rights reserved.
//

import Foundation
import UIKit

class NetworkManager {
    
    
    static func downloadPicture(imageURL: String) -> UIImage? {
        if let url = URL(string: imageURL), let data = try? Data(contentsOf: url) {
            return UIImage(data: data)
        }
        return nil
    }
}
