//
//  NavigationController.swift
//  AppStoreJSONApisCombine
//
//  Created by Alberto Garcia on 12/01/22.
//

import UIKit

final class NavigationController: UINavigationController, ViewControllable {
    
    private var rootViewController: UIViewController {
        guard let viewController = viewControllers.first else {
            fatalError("rootViewController has not set")
        }
        return viewController
    }
    
    init(rootViewController: UIViewController,
         title: String,
         imageName: String) {
        super.init(rootViewController: rootViewController)
        self.rootViewController.navigationItem.title = title
        self.rootViewController.tabBarItem.image = UIImage(systemName: imageName)
        self.rootViewController.tabBarItem.title = title
        self.navigationBar.prefersLargeTitles = true
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
