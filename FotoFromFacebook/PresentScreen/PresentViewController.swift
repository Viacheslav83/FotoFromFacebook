//
//  PresentViewController.swift
//  FotoFromFacebook
//
//  Created by Viacheslav Markov on 24.03.2021.
//

import UIKit

class PresentViewController: UIViewController, Storyboarded {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var coordinator: PresentCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
