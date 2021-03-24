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
    var image: UIImage!
    var numberFrom: String
    

    init(navigationController: UINavigationController, atFoto: UIImage?, number fromCount: String) {
        self.navigationController = navigationController
        self.image = atFoto
        self.numberFrom = fromCount
    }

    func start() {
        let presentViewController = PresentViewController.instantiate()
        let presentViewModel = PresentViewModel(image: image, number: numberFrom)
        presentViewController.coordinator = self
        presentViewController.viewModel = presentViewModel
        navigationController.pushViewController(presentViewController, animated: false)
    }

}

