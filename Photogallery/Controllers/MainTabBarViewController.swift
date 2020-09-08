//
//  MainTabBarViewController.swift
//  Photogallery
//
//  Created by Roman Oliinyk on 06.09.2020.
//  Copyright © 2020 Roman Oliinyk. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    
    let photosVC = PhotosCollectionViewController(collectionViewLayout: UICollectionViewLayout())
    let favouritesVC = FavouritesCollectionViewController(collectionViewLayout: UICollectionViewLayout())

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.tintColor = .systemIndigo
        tabBar.shadowImage = UIImage()
        view.backgroundColor = .systemBackground

        viewControllers = [generateNavagationController(rootViewController: photosVC, title: "Photos", image: UIImage(systemName: "photo", withConfiguration: UIImage.SymbolConfiguration(weight: .regular))!), generateNavagationController(rootViewController: favouritesVC, title: "Favourites", image: UIImage(systemName: "heart", withConfiguration: UIImage.SymbolConfiguration(weight: .medium))!)]
        
    }
    
    private func generateNavagationController(rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        return navigationVC
    }
    
    
}

