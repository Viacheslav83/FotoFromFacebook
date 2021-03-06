//
//  Storyboarded.swift
//  FotoFromFacebook
//
//  Created by Viacheslav Markov on 24.03.2021.
//

import UIKit

protocol Storyboarded {
    static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate() -> Self {
        // this pulls out "MyApp.MyViewController"
        let fullName = NSStringFromClass(self)

        // this splits by the dot and uses everything after, giving "MyViewController"
        let className = fullName.components(separatedBy: ".")[1]
        
        let storyboardName = className.replacingOccurrences(of: "ViewController", with: "")

        // load our storyboard
        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle.main)
        

        // instantiate a view controller with that identifier, and force cast as the type that was requested
        guard let viewController = storyboard.instantiateViewController(withIdentifier: className) as? Self else {
            fatalError("instantiate is not very good for: ClassName \(className)")
        }
        
        return viewController
    }
}
