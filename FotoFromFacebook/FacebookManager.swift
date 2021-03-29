//
//  FacebookManager.swift
//  FotoFromFacebook
//
//  Created by Viacheslav Markov on 25.03.2021.
//

import UIKit
import FBSDKLoginKit
import SwiftyJSON

class FacebookManager {
    static let shared = FBSDKLoginKit.LoginManager()
    
    public class func getUserData(completion: @escaping () -> Void) {
        if AccessToken.current != nil {
            GraphRequest(graphPath: "me",
                         parameters: ["fields": "name, email, picture.type(normal)"],
                         httpMethod: HTTPMethod(rawValue: "GET")
                         ).start
                { (connection, result, error) in
                            if error == nil {
                                let json = JSON(result)
                                print(json)
                                
                                User.currentUser.setupUser(json)
                                
                                UserSettings.userAvatarUrl = User.currentUser.imageUrl
                                
                                completion()
                            }
                         }
            
        }
    }
    
}
