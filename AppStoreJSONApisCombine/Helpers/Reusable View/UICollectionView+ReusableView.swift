//
//  UICollectionView+ReusableView.swift
//  AppStoreJSONApisCombine
//
//  Created by Alberto Garcia on 21/08/21.
//

import UIKit

extension UICollectionView {
    func register<T: UICollectionViewCell>(_ : T.Type) where T: ReusableView {
        register(T.self,
                 forCellWithReuseIdentifier: T.defaultReuseIdentifier)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T where T: ReusableView {
        register(T.self)
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.defaultReuseIdentifier,
                                             for: indexPath) as? T
        else {
            fatalError("Could not dequeue cell with identifier \(T.defaultReuseIdentifier)")
        }
        return cell
    }
}
