//
//  ImagesViewController.swift
//  FotoFromFacebook
//
//  Created by Viacheslav Markov on 24.03.2021.
//

import UIKit

class ImagesViewController: UIViewController, Storyboarded {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var coordinator: ImagesCoordinator?
    var viewModel: ImagesViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(ImageCollectionViewCell.nib(), forCellWithReuseIdentifier: "ImageCollectionViewCell")

        collectionView.delegate = self
        collectionView.dataSource = self

    }
    
}

extension ImagesViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let numberFromCount = "\(indexPath.row + 1)" + "/" + "\(viewModel?.numberOfImages ?? 1)"
        coordinator?.displayPresent(atFoto: viewModel?.getImage(at: indexPath.row),
                                    number: numberFromCount)
    }
}

extension ImagesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.numberOfImages ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as? ImageCollectionViewCell else { return UICollectionViewCell() }

        cell.configure(with: viewModel?.getImage(at: indexPath.row) ?? UIImage())
        return cell
    }
    
    
}

extension ImagesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let weight = (view.frame.width - 30) / 3
        return CGSize(width: weight, height: weight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
    }
    
}
