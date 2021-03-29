//
//  UserSettings.swift
//  FotoFromFacebook
//
//  Created by Viacheslav Markov on 29.03.2021.
//

import Foundation

final class UserSettings {
    
    private enum UserKey: String {
        case imageUrl
    }
    
    static var userAvatarUrl: String? {
        get {
            return UserDefaults.standard.string(forKey: UserKey.imageUrl.rawValue) ?? ""
        }
        set {
            let defaults = UserDefaults.standard
            let key = UserKey.imageUrl.rawValue
            if let url = newValue {
                
//                print("URL was added \(url)")
                defaults.set(url, forKey: key)
            }
        }
    }
}
