//
//  LoginViewController.swift
//  FotoFromFacebook
//
//  Created by Viacheslav Markov on 24.03.2021.
//

import UIKit

class LoginViewController: UIViewController, Storyboarded {
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    var coordinator: LoginCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLogoImage()
        
        setupEmailTextField()
        setupPasswordTextField()
    }
    
    func setupLogoImage() {
        logoImageView.image = UIImage(named: "Facebook_Logo")
    }
    
    func setupEmailTextField() {
        emailTextField.placeholder = "Entered your Email"
    }
    
    func setupPasswordTextField() {
        passwordTextField.placeholder = "Entered your Password"
    }

    @IBAction func loginButtonTapped(_ sender: Any) {
        coordinator?.displayImages()
    }
    
}
