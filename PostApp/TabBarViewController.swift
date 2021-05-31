//
//  TabBarViewController.swift
//  PostApp
//
//  Created by Valentin on 25.05.2021.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        UITabBar.appearance().barTintColor = .white
        tabBar.tintColor = .label
        setupVCs()
    }

    
    func setupVCs() {
            viewControllers = [
                createNavController(for: MainViewController(orderBy: .createdAt), title: "Created", image: UIImage(systemName: "bolt.heart")!),
                createNavController(for: MainViewController(orderBy: .mostCommented), title: "Commented", image: UIImage(systemName: "scribble.variable")!),
                createNavController(for: MainViewController(orderBy: .mostPopular), title: "Popular", image: UIImage(systemName: "flame")!)
            ]
        }
    
    func createNavController(for rootViewController: UIViewController,
                                                      title: String,
                                                      image: UIImage) -> UIViewController {
            let navController = UINavigationController(rootViewController: rootViewController)
            navController.tabBarItem.title = title
            navController.tabBarItem.image = image
            navController.navigationBar.prefersLargeTitles = true
            rootViewController.navigationItem.title = title
            return navController
        }
    
}
