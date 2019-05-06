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
    
    static func updateUser(name: String, email: String, phone: String, company: String, position: String, website: String, completion: @escaping(User?,String) -> Void){
        
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
                let jsonDecoder = JSONDecoder()
                if let user = try? jsonDecoder.decode(UserDataResponse.self, from: data) {
                    completion(user.data, "Successful")
                } else if let errorRes = try? jsonDecoder.decode(ErrorResponse.self, from: data){
                    completion(nil,errorRes.error)
                } else {
                    completion(nil, "Unexpected error. Try again.")
                }
            case .failure( _):
                completion(nil, "Unexpected error. Try again.")
            }
        }
    }
    
    static func deleteContact(their_id: Int, completion: @escaping(String) -> Void){
        let url = "\(baseURL)/api/user/\(String(id))/\(String(their_id))"
        Alamofire.request(url, method: .delete, parameters: [:], encoding: Alamofire.JSONEncoding.default, headers: [:]).validate().responseData(){
            (response) in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if (try? jsonDecoder.decode(UserDataResponse.self, from: data)) != nil {
                    completion("Successful")
                } else if let errorRes = try? jsonDecoder.decode(ErrorResponse.self, from: data){
                    completion(errorRes.error)
                } else {
                    completion("Unexpected error. Try again.")
                }
            case .failure( _):
                completion("Unexpected error. Try again.")
            }
        }
    }
    
    static func addContact(their_code: String, completion: @escaping (String)->Void){
        let url = "\(baseURL)/api/user/\(String(id))/\(their_code)/"
        Alamofire.request(url, method: .post, parameters: [:], encoding: Alamofire.JSONEncoding.default, headers: [:]).validate().responseData(){
            response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if (try? jsonDecoder.decode(UserDataResponse.self, from: data)) != nil {
                    completion("Successful")
                } else if let errorRes = try? jsonDecoder.decode(ErrorResponse.self, from: data){
                    completion(errorRes.error)
                } else {
                    completion("Unexpected error. Try again.")
                }
            case .failure( _):
                completion("Unexpected error. Try again.")
            }
        }
    }
    
    static func downloadPicture(imageURL: String) -> UIImage? {
        if let url = URL(string: imageURL), let data = try? Data(contentsOf: url) {
            return UIImage(data: data)
        }
        return nil
    }

    static func getContacts(completion: @escaping ([User]?, String) -> Void){
        let url = "\(baseURL)/api/user/\(String(id))/"
        Alamofire.request(url, method: .post, parameters: [:], encoding: Alamofire.JSONEncoding.default, headers: [:]).validate().responseData(){
            response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let userRes = try? jsonDecoder.decode(UserDataResponse.self, from: data) {
                    completion(userRes.data.contacts, "Successful")
                } else if let errorRes = try? jsonDecoder.decode(ErrorResponse.self, from: data){
                    completion(nil, errorRes.error)
                } else {
                    completion(nil, "Unexpected error. Try again.")
                }
            case .failure( _):
                completion(nil, "Unexpected error. Try again.")
            }
        }
    }
    
    static func uploadPicture(image: UIImage){
        guard let imgData = image.pngData() else {
            return
        }
        let url = "\(baseURL)/api/images/\(String(id))/"
        Alamofire.upload(multipartFormData: { multipartFormData in
            multipartFormData.append(imgData, withName: "uploads", fileName: String(id) + ".png", mimeType: "image/png")
        }, to: url, method: .post, headers: [:]){
            result in
            UserDefaults.standard.set(baseURL+"/api/images/\(String(id))/", forKey: UserDefaultKeys.imgURL.rawValue)
        }
        
    }
}
