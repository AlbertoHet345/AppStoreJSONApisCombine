//
//  URLSessionHTTPClient.swift
//  AppStoreJSONApisCombine
//
//  Created by Alberto Garcia on 11/01/22.
//

import Foundation
import Combine

class URLSessionHTTPClient: HTTPClient {
    private var session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func request<K, R>(for endpoint: Endpoint<K, R>,
                       with requestData: K.RequestData,
                       decoder: JSONDecoder = .init()) -> AnyPublisher<R, Error> where K: EndpointKind, R: Decodable {
        guard let request = endpoint.makeRequest(with: requestData) else {
            return Fail(error: NetworkError.BadRequest)
                .eraseToAnyPublisher()
        }
        return session.dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: NetworkResponse<R>.self, decoder: decoder)
            .map(\.results)
            .eraseToAnyPublisher()
    }
}
