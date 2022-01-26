//
//  SearchResult.swift
//  AppStoreJSONApisCombine
//
//  Created by Alberto Garcia on 21/08/21.
//

import Foundation

struct SearchResult: Decodable {
    let resultCount: Int
    let results: [Result]
}
