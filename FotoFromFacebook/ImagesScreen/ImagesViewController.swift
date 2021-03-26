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
    
    var userPhotos: NSArray?
    var image: [UIImage]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(ImageCollectionViewCell.nib(), forCellWithReuseIdentifier: "ImageCollectionViewCell")

        collectionView.delegate = self
        collectionView.dataSource = self
        
        if let _ = AccessToken.current {
            fetchListOfUserPhotos()
        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fetchListOfUserPhotos() {
        let graphRequest: GraphRequest = GraphRequest(graphPath: "me/photos", parameters: ["fields" : "picture"] )
        
  
        graphRequest.start(completionHandler: { (connection, result, error) -> Void in
            
            if ((error) != nil)
            {
                // Process error
                print("Error: \(error)")
            }
            else
            {
                print("fetched user: \(result)")
                
                let fbResult:[String:AnyObject] = result as! [String : AnyObject]
                
                self.userPhotos = fbResult["data"] as! NSArray?
                
                self.collectionView.reloadData()
 
            }
        })
    }
    
}

extension ImagesViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let numberFromCount = "\(indexPath.row + 1)" + "/" + "\(userPhotos?.count ?? 0 + 1)"
        coordinator?.displayPresent(atFoto: image?[indexPath.row],
                                    number: numberFromCount)
    }
}

extension ImagesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        var returnValue = 0
        
        if let userPhotosObject = userPhotos {
            returnValue = userPhotosObject.count
        }
        
        return returnValue
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as? ImageCollectionViewCell else { return UICollectionViewCell() }

        cell.backgroundColor = UIColor.black
       
        let userPhotoObject = userPhotos?[indexPath.row] as? NSDictionary
        let userPhotoUrlString = userPhotoObject?.value(forKey: "picture") as? String ?? ""

        guard let imageUrl: URL = URL(string: userPhotoUrlString) else { return UICollectionViewCell() }

        DispatchQueue.global(qos: .userInitiated).async  {

            let imageData:Data = try! Data(contentsOf: imageUrl)
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: cell.frame.size.width, height: cell.frame.size.height))

            // Add photo to a cell as a subview
            DispatchQueue.main.async {
                let image = UIImage(data: imageData)
                imageView.image = image
                imageView.contentMode = UIView.ContentMode.scaleAspectFit
                cell.configure(with: imageView.image)
                self.image?.append(imageView.image ?? UIImage())
            }
        }
        
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
