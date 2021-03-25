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
    let presentViewModel: PresentViewModel
    
    init(navigationController: UINavigationController, atFoto: UIImage?, number fromCount: String) {
        self.navigationController = navigationController
        presentViewModel = PresentViewModel(image: atFoto ?? UIImage(), number: fromCount)
    }

    func start() {
        let presentViewController = PresentViewController.instantiate()
        presentViewController.coordinator = self
        presentViewController.viewModel = presentViewModel
        navigationController.pushViewController(presentViewController, animated: false)
    }
}
