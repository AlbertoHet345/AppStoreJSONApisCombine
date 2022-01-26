//
//  NavigationFactory.swift
//  AppStoreJSONApisCombine
//
//  Created by Alberto Garcia on 12/01/22.
//

import Foundation

protocol NavigationFactory {
    func makeNavigationController(viewController: ViewControllable,
                                  title: String,
                                  imageName: String) -> ViewControllable
}

final class TabNavigationFactory: NavigationFactory {
    func makeNavigationController(viewController: ViewControllable,
                                  title: String,
                                  imageName: String) -> ViewControllable {
        NavigationController(rootViewController: viewController.viewController,
                             title: title,
                             imageName: imageName)
    }
}
