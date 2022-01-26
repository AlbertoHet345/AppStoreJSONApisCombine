//
//  SearchViewControllerFactory.swift
//  AppStoreJSONApisCombine
//
//  Created by Alberto Garcia on 12/01/22.
//

import Foundation

protocol SearchFactory {
    func makeSearch() -> ViewControllable
}

final class SearchViewControllerFactory: SearchFactory {
    func makeSearch() -> ViewControllable {
        SearchViewController()
    }
}
