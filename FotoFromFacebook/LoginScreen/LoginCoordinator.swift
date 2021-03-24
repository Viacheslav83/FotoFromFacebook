//
//  LoginCoordinator.swift
//  FotoFromFacebook
//
//  Created by Viacheslav Markov on 24.03.2021.
//

import UIKit

class LoginCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let loginViewController = LoginViewController.instantiate()
        loginViewController.coordinator = self
        navigationController.pushViewController(loginViewController, animated: false)
    }
    
    func displayImages() {
        let imagesCoordinator = ImagesCoordinator(navigationController: navigationController)
        imagesCoordinator.start()
    }
}
