//
//  PresentViewController.swift
//  FotoFromFacebook
//
//  Created by Viacheslav Markov on 24.03.2021.
//

import UIKit

class PresentViewController: UIViewController, Storyboarded {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var numberLabel: UILabel!
    
    var coordinator: PresentCoordinator?
    var viewModel: PresentViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = viewModel?.image
        numberLabel.text = viewModel?.numberFrom
    }

}
