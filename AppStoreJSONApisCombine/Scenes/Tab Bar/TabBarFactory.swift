//
//  TabBarFactory.swift
//  AppStoreJSONApisCombine
//
//  Created by Alberto Garcia on 12/01/22.
//

import Foundation

protocol TabBarFactory {
    func makeTabBar() -> ViewControllable
}

final class BaseTabBarFactory: TabBarFactory {
    func makeTabBar() -> ViewControllable {
        BaseTabBarController()
    }
}
