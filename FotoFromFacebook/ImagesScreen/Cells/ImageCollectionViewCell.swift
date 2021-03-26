//
//  ImageCollectionViewCell.swift
//  FotoFromFacebook
//
//  Created by Viacheslav Markov on 24.03.2021.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "ImageCollectionViewCell", bundle: nil)
    }
    
    func configure(with image: UIImage?) {
        imageView.image = image
    }

}
