//
//  LoginViewController.swift
//  FotoFromFacebook
//
//  Created by Viacheslav Markov on 24.03.2021.
//

import UIKit
import FBSDKLoginKit

class LoginViewController: UIViewController, Storyboarded {
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var loginButton: UIButton!
    
    var coordinator: LoginCoordinator?
    var isLogin = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLogoImage()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        if (AccessToken.current != nil && isLogin) {
            coordinator?.displayImages()
        }
    }
    
    func setupLogoImage() {
        logoImageView.image = UIImage(named: "Facebook_Logo")
    }

    @IBAction func loginButtonTapped(_ sender: Any) {
        if AccessToken.current != nil {
            isLogin = true
            viewDidAppear(true)
        } else {
            FacebookManager.shared.logIn(permissions: ["public_profile", "email"],
                                         from: self)
            { (result, error) in
                if error == nil {
                    FacebookManager.getUserData {
                        self.isLogin = true
                        self.viewDidAppear(true)
                    }
                }
            }
        }
    }
}
