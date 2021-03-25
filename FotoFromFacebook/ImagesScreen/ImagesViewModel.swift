//
//  ImagesViewModel.swift
//  FotoFromFacebook
//
//  Created by Viacheslav Markov on 24.03.2021.
//

struct List {
    var image: UIImage
    var nameOfImage: String
}

import UIKit

class ImagesViewModel {
    
    var numberOfImages = 16
    
    func getImage(at index: Int) -> UIImage? {
        return UIImage(named: "img\(index + 1)")
    }
}
