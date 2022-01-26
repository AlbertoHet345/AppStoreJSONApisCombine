//
//  EndpointKinds.swift
//  AppStoreJSONApisCombine
//
//  Created by Alberto Garcia on 11/01/22.
//

import Foundation

enum EndpointKinds {
    enum Public: EndpointKind {
        static func prepare(_ request: inout URLRequest,
                            with data: Void) {
            request.cachePolicy = .reloadIgnoringLocalCacheData
        }
    }
}
