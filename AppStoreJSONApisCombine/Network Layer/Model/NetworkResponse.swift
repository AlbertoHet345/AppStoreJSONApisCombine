//
//  NetworkResponse.swift
//  AppStoreJSONApisCombine
//
//  Created by Alberto Garcia on 11/01/22.
//

import Foundation

struct NetworkResponse<Wrapped: Decodable>: Decodable {
    var results: Wrapped
}
