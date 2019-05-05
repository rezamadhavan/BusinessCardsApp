//
//  NetworkManager.swift
//  Hackathon_Submission
//
//  Created by Reza Madhavan on 4/20/19.
//  Copyright © 2019 Reza Madhavan. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class NetworkManager {
    private static let baseURL = "http://34.73.24.69"
    private static let id = UserDefaults.standard.integer(forKey: UserDefaultKeys.id.rawValue)
    
    static func create_user(name: String, email: String, phone: String, company: String, position: String, website: String, completion: @escaping(User?) -> Void){
        let params: [String:String] = [
            "name": name,
            "email": email,
            "phone": phone,
            "company": company,
            "position": position,
            "website": website
        ]
        
        Alamofire.request(baseURL+"/api/users/", method: .post, parameters: params, encoding: Alamofire.JSONEncoding.default, headers: [:]).validate().responseData(){
            response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let userRes = try? jsonDecoder.decode(UserDataResponse.self, from: data) {
                    if userRes.success {
                        completion(userRes.data)
                    }
                    else {
                        print("Got through server but invalid request")
                        completion(nil)
                    }
                } else {
                    print("JSON parser Error")
                    completion(nil)
                }
            case .failure(let error):
                print("Some other weird error: \(error)")
                completion(nil)
            }
        }
    }
    
    static func updateUser(name: String, email: String, phone: String, company: String, position: String, website: String, completion: @escaping(User?) -> Void){
        
        let params: [String:String] = [
            "name": name,
            "email": email,
            "phone": phone,
            "company": company,
            "position": position,
            "website": website
        ]
        
        let url = "\(baseURL)/api/user/\(String(id))/"
        Alamofire.request(url, method: .post, parameters: params, encoding: Alamofire.JSONEncoding.default, headers: [:]).validate().responseData(){
            (response) in
            switch response.result {
            case .success(let data):
                print("Updated user")
            case .failure(let error):
                print("Some other weird error: \(error)")
            }
        }
    }
    
    static func deleteContact(their_id: Int){
        let url = "\(baseURL)/api/user/\(String(id))/\(String(their_id))"
        Alamofire.request(url, method: .delete, parameters: [:], encoding: Alamofire.JSONEncoding.default, headers: [:]).validate().responseData(){
            (response) in
            switch response.result {
            case .success(let data):
                print("Deleted user")
            case .failure(let error):
                print("Some other weird error: \(error)")
            }
        }
    }
    
    static func addContact(their_code: String, completion: @escaping (User?)->Void){
        let url = "\(baseURL)/api/user/\(String(id))/\(their_code)/"
        Alamofire.request(url, method: .post, parameters: [:], encoding: Alamofire.JSONEncoding.default, headers: [:]).validate().responseData(){
            response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let userRes = try? jsonDecoder.decode(UserDataResponse.self, from: data) {
                    if userRes.success {
                        completion(userRes.data)
                    }
                    else {
                        print("Got through server but invalid request")
                        completion(nil)
                    }
                } else {
                    print("JSON parser Error")
                    completion(nil)
                }
            case .failure(let error):
                print("Some other weird error: \(error)")
            }
        }
    }
    
    static func downloadPicture(imageURL: String) -> UIImage? {
        if let url = URL(string: imageURL), let data = try? Data(contentsOf: url) {
            return UIImage(data: data)
        }
        return nil
    }
}
