//
//  BaseTabBarController.swift
//  AppStoreJSONApisCombine
//
//  Created by Alberto Garcia on 12/01/22.
//

import UIKit

final class BaseTabBarController: UITabBarController, ViewControllable {
    
    let searchFactory: SearchFactory = SearchViewControllerFactory()
    let navigationFactory: NavigationFactory = TabNavigationFactory()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [
            navigationFactory.makeNavigationController(viewController: searchFactory.makeSearch(),
                                                       title: "Search",
                                                       imageName: "magnifyingglass").viewController,
            
            makeController(viewController: searchFactory.makeSearch(),
                           title: "Search",
                           icon: "magnifyingglass"),
            
            make(viewController: SearchViewController(),
                 title: "Search",
                 icon: "magnifyingglass")
        ]
    }
    
    private func makeController(viewController: ViewControllable,
                                title: String,
                                icon: String) -> UIViewController {
        let vc = viewController.viewController
        vc.tabBarItem.title = title
        vc.tabBarItem.image = UIImage(systemName: icon)
        vc.navigationItem.title = title
        let navController = UINavigationController(rootViewController: vc)
        navController.navigationBar.prefersLargeTitles = true
        return navController
    }
    
    private func make(viewController: UIViewController,
                      title: String,
                      icon: String) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = UIImage(systemName: icon)
        viewController.navigationItem.title = title
        let navController = UINavigationController(rootViewController: viewController)
        navController.navigationBar.prefersLargeTitles = true
        return navController
    }
}
