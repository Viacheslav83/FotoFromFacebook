//
//  ImagesCoordinator.swift
//  FotoFromFacebook
//
//  Created by Viacheslav Markov on 24.03.2021.
//

import UIKit

class ImagesCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let imagesCoordinator = ImagesViewController.instantiate()
        imagesCoordinator.coordinator = self
        navigationController.pushViewController(imagesCoordinator, animated: true)
    }
    
    func displayPresent(atFoto: UIImage?, number fromCount: String) {
        let presentCoordinator = PresentCoordinator(navigationController: navigationController,
                                                    atFoto: atFoto,
                                                    number: fromCount)
        presentCoordinator.start()
    }
    
}
