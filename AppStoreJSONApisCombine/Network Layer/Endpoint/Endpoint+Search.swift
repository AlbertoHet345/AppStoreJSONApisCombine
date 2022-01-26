//
//  Endpoint+Search.swift
//  AppStoreJSONApisCombine
//
//  Created by Alberto Garcia on 11/01/22.
//

import Foundation

extension Endpoint where Kind == EndpointKinds.Public, Response == [Result] {
    static func search(for query: String) -> Self {
        Endpoint(path: "search", queryItems: [
            URLQueryItem(name: "term", value: query),
            URLQueryItem(name: "entity", value: "software")
        ])
    }
}
