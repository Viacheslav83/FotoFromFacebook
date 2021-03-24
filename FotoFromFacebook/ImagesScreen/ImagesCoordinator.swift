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
//        let imagesViewModel = ImagesViewModel()
        imagesCoordinator.coordinator = self
//        imagesCoordinator.viewModel = imagesViewModel
        navigationController.pushViewController(imagesCoordinator, animated: true)
    }
    
    func displayPresent() {
        let presentCoordinator = PresentCoordinator(navigationController: navigationController)
        presentCoordinator.start()
    }
    
}
