//
//  EndpointKind.swift
//  AppStoreJSONApisCombine
//
//  Created by Alberto Garcia on 11/01/22.
//

import Foundation

protocol EndpointKind {
    associatedtype RequestData
    
    static func prepare(_ request: inout URLRequest,
                        with data: RequestData) 
}
