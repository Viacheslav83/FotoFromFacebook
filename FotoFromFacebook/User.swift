//
//  User.swift
//  FotoFromFacebook
//
//  Created by Viacheslav Markov on 26.03.2021.
//

import Foundation
import SwiftyJSON

class User {
    var name: String?
    var email: String?
    var imageUrl: String?
    
    static let currentUser = User()
    
    func setupUser(_ json: JSON) {
        self.name = json["name"].string
        self.email = json["email"].string
        
        let image = json["picture"].dictionary
        let data = image?["data"]?.dictionary
        self.imageUrl = data?["url"]?.string
    }
}
