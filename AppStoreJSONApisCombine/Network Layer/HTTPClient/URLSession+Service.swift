//
//  URLSession+Service.swift
//  AppStoreJSONApisCombine
//
//  Created by Alberto Garcia on 11/01/22.
//

import Foundation
import Combine

extension URLSession: HTTPClient {
    func request<K, R>(for endpoint: Endpoint<K, R>,
                       with requestData: K.RequestData,
                       decoder: JSONDecoder = .init()) -> AnyPublisher<R, Error> where K : EndpointKind, R : Decodable {
        guard let request = endpoint.makeRequest(with: requestData) else {
            return Fail(error: NetworkError.BadRequest)
                .eraseToAnyPublisher()
        }
        return dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: NetworkResponse<R>.self, decoder: decoder)
            .map(\.results)
            .eraseToAnyPublisher()
    }
}
