//
//  ImagesViewController.swift
//  FotoFromFacebook
//
//  Created by Viacheslav Markov on 24.03.2021.
//

import UIKit
import FBSDKCoreKit

class ImagesViewController: UIViewController, Storyboarded {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var coordinator: ImagesCoordinator?
    
    var avatarImage: [UIImage?] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(ImageCollectionViewCell.nib(), forCellWithReuseIdentifier: "ImageCollectionViewCell")

        collectionView.delegate = self
        collectionView.dataSource = self
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {

            if let url = URL(string: UserSettings.userAvatarUrl ?? "") {
                let data = try! Data(contentsOf: url)
                self.avatarImage.append(UIImage(data: data))

            }
            self.collectionView.reloadData()
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ImagesViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let numberFromCount = "\(indexPath.row + 1)" + "/" + "\(avatarImage.count)"
        coordinator?.displayPresent(atFoto: avatarImage[indexPath.row],
                                    number: numberFromCount)
    }
}

extension ImagesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        var returnValue = 0

        if avatarImage.count != 0 {
            returnValue = avatarImage.count
        }
        
        return returnValue
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as? ImageCollectionViewCell else { return UICollectionViewCell() }

        cell.configure(with: avatarImage[indexPath.row])
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
