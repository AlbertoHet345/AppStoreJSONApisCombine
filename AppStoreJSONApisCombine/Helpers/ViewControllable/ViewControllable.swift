//
//  ViewControllable.swift
//  AppStoreJSONApisCombine
//
//  Created by Alberto Garcia on 12/01/22.
//

import UIKit

protocol ViewControllable {
    var viewController: UIViewController { get }
}

extension ViewControllable where Self: UIViewController {
    var viewController: UIViewController {
        return self
    }
}
