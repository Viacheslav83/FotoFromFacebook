//
//  PresentCoordinator.swift
//  FotoFromFacebook
//
//  Created by Viacheslav Markov on 24.03.2021.
//

import UIKit

class PresentCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let presentViewController = PresentViewController.instantiate()
        presentViewController.coordinator = self
        navigationController.pushViewController(presentViewController, animated: false)
    }

}

