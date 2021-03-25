//
//  CurrentUser.swift
//  FotoFromFacebook
//
//  Created by Viacheslav Markov on 25.03.2021.
//

import UIKit

class CurrentUser {
    var isUser: Bool
    
    init() {
        isUser = true
    }
    
    func isCurentUser() -> Bool {
        return isUser
    }
}
