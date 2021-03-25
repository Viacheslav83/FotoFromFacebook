//
//  PresentViewModel.swift
//  FotoFromFacebook
//
//  Created by Viacheslav Markov on 24.03.2021.
//

import UIKit

class PresentViewModel {
    let image: UIImage
    let numberFrom: String
    
    init(image: UIImage, number: String) {
        self.image = image
        numberFrom = number
    }
}
