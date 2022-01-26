//
//  ReusableView.swift
//  AppStoreJSONApisCombine
//
//  Created by Alberto Garcia on 21/08/21.
//

import UIKit

protocol ReusableView {
    static var defaultReuseIdentifier: String { get }
}

extension ReusableView where Self: UIView {
    static var defaultReuseIdentifier: String {
        String(describing: self)
    }
}
