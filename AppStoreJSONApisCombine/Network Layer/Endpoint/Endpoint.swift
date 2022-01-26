//
//  Endpoint.swift
//  AppStoreJSONApisCombine
//
//  Created by Alberto Garcia on 11/01/22.
//

import Foundation

protocol EndpointType {
    var path: String { get }
    var queryItems: [URLQueryItem] { get }
}

struct Endpoint<Kind: EndpointKind, Response: Decodable> {
    var path: String
    var queryItems = [URLQueryItem]()
}

extension Endpoint {
    func makeRequest(with data: Kind.RequestData) -> URLRequest? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "itunes.apple.com"
        components.path = "/" + path
        components.queryItems = queryItems.isEmpty ? nil : queryItems
        
        guard let url = components.url else {
            return nil
        }
        
        var request = URLRequest(url: url)
        Kind.prepare(&request, with: data)
        return request
    }
    
    func makeRequest(from url: URL) -> URLRequest? {
        URLRequest(url: url)
    }
}
